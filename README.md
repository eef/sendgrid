SendgridWeb
===========

Simple library for interacting with the SendGrid Web API

At the moment only blocks and bounces work.  Delete and count will be
added shortly.

How to use
----------

Your api user will be your username for SendGrid and your api key will be your password.

    blocks = SendgridWeb::Blocks.new("api_user", "api_key")

    all_blocks = blocks.get

    all_block.each do |block|
      puts block.status
      puts block.email
    end


Copyright (c) 2014 Pipeline Success
