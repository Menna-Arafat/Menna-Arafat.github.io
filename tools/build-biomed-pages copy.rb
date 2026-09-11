# All courses:
#   bundle exec ruby tools/build-biomed-pages.rb
# One course:
#   bundle exec ruby tools/build-biomed-pages.rb --course=metaanalysis

require 'nokogiri'; require 'yaml'; require 'pathname'; require 'json'
require 'fileutils'; require 'open3'; require 'tmpdir'

target = ARGV.find { |x| x.start_with?('--course=') }&.split('=',2)&.last
root_arg = ARGV.find { |x| !x.start_with?('--') }
root = Pathname.new(root_arg || File.expand_path('..',__dir__)).expand_path
src_root = root.join('docs/_docs/en'); out_root = root.join('courses')
nav_path = root.join('_data/navigation.yml')
abort "Missing #{src_root}" unless src_root.exist?
abort "Missing #{nav_path}" unless nav_path.exist?

def atomic_write(path,text)
  path.dirname.mkpath; tmp=Pathname.new("#{path}.tmp")
  File.open(tmp,'w'){|f| f.write(text); f.flush; f.fsync}
  File.rename(tmp.to_s,path.to_s)
end

def humanize(s) = s.tr('_-',' ').split.map(&:capitalize).join(' ')

def clean_chapter_title(s)
  s=s.to_s.tr("\u00A0",' ').strip
  s=s.sub(/\AChapter\s*\d+\s*[:.\-–—]?\s*/i,'')
  s.strip
end

def valid_chapter?(href,title)
  h=href.to_s.strip; t=title.to_s.strip
  return false if h.empty? || h.include?('#') || !h.end_with?('.html')
  return false if File.basename(h).casecmp('404.html').zero?
  return false if t.match?(/\A(?:page not found|404)\z/i)
  true
end

def remove_page_not_found_entries(text)
  lines=text.lines; out=[]; i=0
  while i<lines.length
    m=lines[i].match(/^(\s*)-\s*title:\s*["']?(Page not found|404)["']?\s*$/i)
    unless m
      out << lines[i]; i+=1; next
    end
    indent=m[1].length; i+=1
    while i<lines.length
      mi=lines[i].match(/^(\s*)-\s*title:/)
      break if mi && mi[1].length<=indent
      break if lines[i].match?(/^\S[^:]*:\s*$/)
      i+=1
    end
  end
  out.join
end

def course_nav_section(course,base_indent)
  a=' '*base_indent; b=' '*(base_indent+2); c=' '*(base_indent+4); d=' '*(base_indent+6)
  s="#{a}- title: #{course[:title].to_json}\n#{b}children:\n#{c}- title: Overview\n#{d}url: /docs/en/#{course[:slug]}\n"
  course[:chapters].each{|ch| s += "#{c}- title: #{ch['title'].to_json}\n#{d}url: #{ch['url']}\n"}
  s
end

def upsert_course_nav(text,course)
  lines=text.lines
  ds=lines.index{|l| l.match?(/^docs-en:\s*$/)}
  abort 'docs-en section not found in navigation.yml' unless ds
  de=((ds+1)...lines.length).find{|i| lines[i].match?(/^\S[^-][^:]*:\s*$/)} || lines.length

  candidates=[]
  (ds+1...de).each do |i|
    if (m=lines[i].match(/^(\s*)-\s*title:/))
      candidates << [i,m[1].length]
    end
  end
  abort 'No navigation items found under docs-en' if candidates.empty?
  base_indent=candidates.map{|x| x[1]}.min
  starts=candidates.select{|x| x[1]==base_indent}.map{|x| x[0]}
  blocks=starts.each_with_index.map{|st,j| [st,(j+1<starts.length ? starts[j+1] : de)]}

  slug=course[:slug]
  found=blocks.find do |st,en|
    block=lines[st...en].join
    block.include?("/docs/en/#{slug}") || block.include?("/courses/#{slug}/")
  end
  section=course_nav_section(course,base_indent).lines

  if found
    lines[found[0]...found[1]]=section
  else
    courses_block=blocks.find{|st,en| lines[st].match?(/^\s*-\s*title:\s*["']?Courses["']?\s*$/)}
    pos=courses_block ? courses_block[1] : ds+1
    lines.insert(pos,*section)
  end
  lines.join
end

def first_heading(path)
  return nil unless path&.exist?
  text=path.read
  if text.start_with?('---') && (m=text.match(/\A---\s*\n(.*?)\n---/m))
    y=YAML.safe_load(m[1]) rescue nil
    return y['title'].to_s.strip if y.is_a?(Hash) && !y['title'].to_s.strip.empty?
  end
  m=text.match(/^[#]{1,6}\s+(.+?)\s*$/)
  m ? m[1].gsub(/[*_`]/,'').strip : nil
end

def render_course(src,stage,input)
  expr="bookdown::render_book(#{JSON.generate(input)},'bookdown::gitbook',output_dir=#{JSON.generate(stage.to_s)})"
  puts "\nRendering #{src.basename} ..."
  out,err,status=Open3.capture3('Rscript','-e',expr,chdir:src.to_s)
  puts out unless out.empty?; warn err unless err.empty?
  abort "Render failed for #{src}" unless status.success?
end

def publish_course(stage,out)
  out.dirname.mkpath; backup=Pathname.new("#{out}.old"); FileUtils.rm_rf(backup)
  FileUtils.mv(out.to_s,backup.to_s) if out.exist?
  FileUtils.mv(stage.to_s,out.to_s); FileUtils.rm_rf(backup)
end

CODE_CSS = <<~CSS
<style id="course-code-style">
.course-chapter p,.course-chapter li{font-size:19px!important;line-height:1.6!important}
.course-chapter table{font-size:16px!important}.course-table-scroll{max-width:100%;overflow-x:auto}
.course-chapter div.sourceCode{position:relative;max-width:100%;margin:.65rem 0 .9rem}
.course-chapter div.sourceCode pre,.course-chapter pre.sourceCode{max-width:100%;overflow-x:auto!important;overflow-y:hidden;white-space:pre!important;margin:0;padding:.75rem 4.8rem .75rem 1rem;box-sizing:border-box;border:1px solid #DDE5E9;border-radius:8px;font-size:17px!important;line-height:1.4!important;scrollbar-width:auto;scrollbar-color:#8299a5 #edf2f4;-webkit-overflow-scrolling:touch}
.course-chapter div.sourceCode pre code,.course-chapter pre.sourceCode code,.course-chapter code.sourceCode{font-size:17px!important;line-height:1.4!important;white-space:pre!important;word-break:normal!important;overflow-wrap:normal!important}
.course-chapter pre:not(.sourceCode),.course-chapter pre:not(.sourceCode) code{font-size:14px!important;line-height:1.3!important}
.course-chapter p code,.course-chapter li code,.course-chapter td code{font-size:.95em}
.course-chapter pre::-webkit-scrollbar{height:10px}.course-chapter pre::-webkit-scrollbar-track{background:#edf2f4}.course-chapter pre::-webkit-scrollbar-thumb{background:#8299a5;border-radius:6px}
.course-copy-btn{position:absolute;top:6px;right:8px;z-index:20;width:32px;height:32px;padding:0;display:flex;align-items:center;justify-content:center;border:1px solid #d5dfe4;border-radius:6px;background:#fff;color:#315B74;cursor:pointer;box-shadow:0 1px 4px rgba(23,54,72,.08)}
.course-copy-btn svg{width:17px;height:17px;stroke:currentColor;fill:none;stroke-width:1.8}.course-copy-btn:hover{background:#f2f6f8}.course-copy-btn.copied{color:#2f7258}
@media(max-width:760px){.course-chapter div.sourceCode pre,.course-chapter div.sourceCode pre code,.course-chapter pre.sourceCode,.course-chapter pre.sourceCode code,.course-chapter pre:not(.sourceCode),.course-chapter pre:not(.sourceCode) code{font-size:13px!important}}
</style>
CSS

CODE_JS = <<~JS
<script id="course-code-copy">
(function(){function fb(t){var a=document.createElement('textarea');a.value=t;a.setAttribute('readonly','');a.style.position='fixed';a.style.opacity='0';document.body.appendChild(a);a.select();var o=false;try{o=document.execCommand('copy')}catch(e){}a.remove();return o}async function cp(t){if(navigator.clipboard&&window.isSecureContext)try{await navigator.clipboard.writeText(t);return true}catch(e){}return fb(t)}function init(){document.querySelectorAll('.course-chapter div.sourceCode').forEach(function(w){if(w.querySelector(':scope > .course-copy-btn'))return;var p=w.querySelector('pre');if(!p)return;var i='<svg viewBox="0 0 24 24"><rect x="9" y="9" width="10" height="10" rx="1.5"></rect><path d="M15 9V6.5A1.5 1.5 0 0 0 13.5 5h-8A1.5 1.5 0 0 0 4 6.5v8A1.5 1.5 0 0 0 5.5 16H9"></path></svg>',b=document.createElement('button');b.type='button';b.className='course-copy-btn';b.innerHTML=i;b.title='Copy code';b.setAttribute('aria-label','Copy code');b.addEventListener('click',async function(){var c=p.querySelector('code'),o=await cp(c?c.innerText:p.innerText);b.innerHTML=o?'✓':'!';b.classList.toggle('copied',o);setTimeout(function(){b.innerHTML=i;b.classList.remove('copied')},1400)});w.appendChild(b)})}document.readyState==='loading'?document.addEventListener('DOMContentLoaded',init):init()})();
</script>
JS

nav=YAML.safe_load(nav_path.read,aliases:true)||{}
docs=nav['docs-en']||=[]
existing_titles={}
docs.each{|item| Array(item['children']).each{|ch| if(m=ch['url'].to_s.match(%r{\A/courses/([^/]+)/})); existing_titles[m[1]]||=item['title'].to_s end}}

configs=src_root.glob('**/_bookdown.yml').sort
abort "No Bookdown courses found under #{src_root}" if configs.empty?

courses=configs.map do |cfg_path|
  src=cfg_path.dirname; cfg=YAML.safe_load(cfg_path.read,aliases:true)||{}
  meta_path=src.join('_course.yml'); meta=meta_path.exist? ? (YAML.safe_load(meta_path.read,aliases:true)||{}) : {}
  slug=(meta['slug']||src.basename.to_s).to_s; rmds=Array(cfg['rmd_files']).map(&:to_s)
  input=rmds.first||(src.join('index.Rmd').exist? ? 'index.Rmd' : src.glob('*.Rmd').sort.first&.basename&.to_s)
  abort "No Rmd input found in #{src}" unless input
  title=meta['title'].to_s.strip
  title=existing_titles[slug].to_s.strip if title.empty?
  title=first_heading(src.join(input)).to_s.strip if title.empty?
  title=humanize(slug) if title.empty?
  {src:src,slug:slug,title:title,input:input,order:(meta['order']||999).to_i,intro:meta['intro'].to_s.strip}
end

if target
  courses.select!{|c| c[:slug]==target || c[:src].basename.to_s==target}
  abort "Course '#{target}' not found." if courses.empty?
end
courses.sort_by!{|c| [c[:order],c[:title].downcase]}

courses.each do |course|
  out=out_root.join(course[:slug]); stage=Pathname.new(Dir.mktmpdir("#{course[:slug]}-bookdown-"))
  render_course(course[:src],stage,course[:input])
  stage.glob('**/404.html').each{|p| FileUtils.rm_f(p)}

  toc=stage.join('index.html')
  toc=stage.glob('*.html').find{|p| Nokogiri::HTML(p.read).at_css('.book-summary')} unless toc.exist?
  abort "No rendered GitBook HTML found for #{course[:title]}" unless toc

  index=Nokogiri::HTML(toc.read)
  chapters=index.css('.book-summary li.chapter > a').filter_map do |a|
    href=a['href'].to_s; title=clean_chapter_title(a.text)
    next unless valid_chapter?(href,title)
    {'title'=>title,'url'=>"/courses/#{course[:slug]}/#{href}",'file'=>href}
  end.uniq{|c| c['file']}
  by_file=chapters.to_h{|c| [c['file'],c]}; converted=[]

  stage.glob('*.html').sort.each do |path|
    next if path.basename.to_s.casecmp('404.html').zero?
    doc=Nokogiri::HTML(path.read); content=doc.at_css('section.normal'); next unless content
    file=path.basename.to_s; title=by_file.dig(file,'title').to_s.strip
    title=content.at_css('#header h1,.section.level1 > h1,h1')&.text.to_s.strip if title.empty?
    title=course[:title] if title.empty?
    title=clean_chapter_title(title)
    content.css('#header').remove; content.css('.section.level1 > h1').first&.remove; content.css('a.anchor-section').remove
    content.css('table').each{|table| wrap=Nokogiri::XML::Node.new('div',doc); wrap['class']='course-table-scroll'; table.add_previous_sibling(wrap); wrap.add_child(table.unlink)}
    front={'layout'=>'article','title'=>title,'nav_key'=>'docs','sidebar'=>{'nav'=>'docs-en'},'aside'=>{'toc'=>true},'show_date'=>false,'show_edit_on_github'=>false,'show_subscribe'=>false,'license'=>false,'mathjax'=>true,'course_chapter'=>true}
    body="#{CODE_CSS}\n<div class=\"course-chapter\">\n#{content.inner_html}\n</div>\n#{CODE_JS}"
    atomic_write(path,front.to_yaml+"---\n{% raw %}\n#{body}\n{% endraw %}\n"); converted<<file
  end
  abort "No pages integrated for #{course[:title]}" if converted.empty?

  if chapters.empty?
    chapters=converted.map do |file|
      raw=stage.join(file).read
      title=YAML.safe_load(raw.split("---\n",3)[1]||'')&.fetch('title',nil) rescue nil
      {'title'=>(title||course[:title]).to_s,'url'=>"/courses/#{course[:slug]}/#{file}",'file'=>file}
    end
  end

  publish_course(stage,out)
  FileUtils.rm_f(out.join('404.html'))

  overview=src_root.glob('*.{md,markdown}').find{|p| p.basename.to_s.sub(/\.(md|markdown)\z/,'').end_with?(course[:slug])}
  overview||=src_root.join("course-#{course[:slug]}.md")

  if overview.exist?
    s=overview.read.split('## Course materials').first.rstrip
  else
    s="---\nlayout: article\ntitle: #{course[:title].to_json}\npermalink: /docs/en/#{course[:slug]}\nnav_key: docs\nsidebar:\n  nav: docs-en\naside:\n  toc: true\n---\n\n#{course[:intro]}"
  end

  s+="\n\n## Course materials\n\nChoose a chapter from the sidebar or the list below.\n\n## Chapters\n\n"
  chapters.each{|c| s+="- [#{c['title']}]({{ \"#{c['url']}\" | relative_url }})\n"}
  atomic_write(overview,s); course[:chapters]=chapters
end

nav_text=remove_page_not_found_entries(nav_path.read)
courses.each{|course| nav_text=upsert_course_nav(nav_text,course)}
YAML.safe_load(nav_text,aliases:true)
atomic_write(nav_path,nav_text) if nav_text != nav_path.read

puts "\nRendered and integrated: #{courses.map{|c| c[:title]}.join(', ')}"