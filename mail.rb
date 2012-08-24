dep 'configured mutt' do
  requires 'mutt.managed',
           'links.managed'
  # Requires my mutt patches
end

dep 'mutt.managed'
dep 'links.managed'

