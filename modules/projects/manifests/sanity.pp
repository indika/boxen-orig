class projects::sanity {

  vcsrepo { "/Users/indika/dev/sanity":
    ensure   => present,
    provider => git,
    source   => 'https://github.com/indika/sanity.git',
    revision => 'master',
    owner    => 'indika',
    group    => 'staff',
  }

  file { '/Users/indika/Library/LaunchAgents/com.hydrasquared.sanity.plist':
    ensure   => present,
    source   => '/Users/indika/dev/sanity/responder/com.hydrasquared.sanity.responder.plist',
    owner    => 'indika',
    group    => 'staff',
    mode     => 644,
  }


  # TODO: Figure out how to use local rubies

  # # ensure a certain ruby version is used in a dir
  # ruby::local { '/Users/indika/dev/sanity/SanityInterface"':
  #   version => '2.2.2',
  #   require => Vcsrepo['/Users/indika/dev/sanity"']
  # }

  # # ensure a gem is installed for a certain ruby version
  # # note, you can't have duplicate resource names so you have to name like so
  # $version = "2.2.2"
  # ruby_gem { "cocoapods for ${version}":
  #   gem          => 'cocoapods',
  #   ruby_version => $version,
  # }

}
