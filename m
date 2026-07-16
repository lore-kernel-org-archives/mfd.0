Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07B429035
	for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214412; cv=none; b=E/40oMEJumnEfZzV31seZm3xn2bJLffgKKMICKMdFKcZsGOeZOK2q/tvUrQ5gIIjtOZ6uL8Z1RdVkxpPRSCiY9t4LyhBpWofhSfeG6eDVfzL92VR8BTi3/JMK6icUMG3Y9S6x/jDFGChm+foSpO26yX33s06Jqr5ImNxHDX9GD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214412; c=relaxed/simple;
	bh=7+u5nQqfv/qWandfNnFPC5wehZ7dDTCwtkF0Yx7+DaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ge5ftxkGdGFshqjDUMgS/zmXyrrD+WSmjQDQzQaShbik6SCWvKkgHPlFM6uMfxMuJseAtwAWtUfsN9k124UT2/ZdOtJL+3oThxtMZNH4l2N3sMG7Cv+WhhVqeIfYaZdnWL/UjL+7LfrfWslMf8x2Lyj+PzVOjIZHp9XVtlI1BXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJaI6pvc; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJaI6pvc"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38df94d4dd8so2512743a91.2
        for <mfd@lists.linux.dev>; Thu, 16 Jul 2026 08:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784214405; x=1784819205; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ij9NGDEmc5LrAtoqRZinGQEY5N7/Qr+UqAm4jAuK+rM=;
        b=GJaI6pvc0PwUlnlszlYdOSML0oAgTp/4Z+WsEp3UZsB42FJjgyqc91/9o8Q4mKAUIK
         x6rvcC7hLOVgqK6zd/sjP2b+rt+DlJ6Zf+2Uztcm6+qBSNwYZvTTMr6fspzO/XRCLelB
         Ch6TDjcSChZjmI9oXW2l79elUdK5xeDO2Zg3Jbj+82e3WGyQ1cCk4PHEfJ2BSUvcExyI
         pwSObaee7aEQkKE5JIpg2VJWZ80f3j6/T6eAGHvZCCe7cNtmcn3ZV/3IIzmW36F54Ckg
         JonF6HdziSzKfiHPkodKtXZhwm13+aU0IlzSnTEcA1e+0+358yWQVAFCE09gimwt6Llz
         NIPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784214405; x=1784819205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ij9NGDEmc5LrAtoqRZinGQEY5N7/Qr+UqAm4jAuK+rM=;
        b=aCGZQOH6tujq23C32nEoWbXPAZXN5rTlJlvmXuH6Sdm0Iv/FenQwkob8KMsw7vGH8C
         KXKFZNZmB7pNF6Hh50+ZiDLfPS8hNP5appu4Rh3WW0NJcim+ZGuH4q832tmvPNQwpGjY
         uRPepy76bA7kmcehdFuStOhsIMx/FKYb6rxMIfhB/JZA3bNcCSnRkfh582qUL9LXT5oF
         RSH8alFY5+ny4735O9sb55ioLrZWUGT4wFZMEW1wS9m57cj5nMjM1jitwnb36FA5e2e0
         icziVE+nTks1RDa6dpck6i9G1C4OX9u/gtXs/B0KSWfRTfPll/N71qeEJMVDEbkRB07o
         TMXw==
X-Forwarded-Encrypted: i=1; AHgh+RpqLNRBsH9l4IuaHfza19UiTJHhCgzRtkdzn7arADNrjB9OZvay+RpZHuQ/Ckr6ZvvlctU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhCcoA02heSN0dL7VVmEfHfuSHJ5gvpF+zIx0nwSjgpqhWAJFm
	naVbtcdkMRt1BvmylibQdSSruvUDvSGOUAPSstoGk7yQnuigD5xh3ghT
X-Gm-Gg: AfdE7clrREClIWT+d4EXS6V+XFpWE+ntZLj91nbGfHxM2FWOHxJS1w6tpm0K4dy6fvl
	gPNy/yCMhfVsUoorMcN+w4KiFK51XxfDRX0jTzqFvsqXrSNkQyOqnGPXtVTMRovFzpPUrfDaf2p
	t6qqAZsBVrq29Aal/0f3/cJ2sMfsYgeRciPxNlCMvWGJkKQVrMEII05uHRvdR2ZV4zAlLeX+1B6
	E18vfWXB7n4RzB1ys9IbPTv66mQItdxS3a2EFN2gdLLhEFdWwu1yDUy/J/VeAQAqbYXzlrnqFjl
	IBNA1gFxZbAdj9gE0FYRixnpMwn/v1datjgQ/VMqrRk4RijqrZTCZdJvOdHqRWDvnxbWc6J7I8G
	0Os1Beo48aituxJDtzUjkJ+9uxmO9bx3rCZslVyml/ZH3vUvjwEgwj1vEAPoy/Mow8m1HgzLQqn
	5bREpRrZFxm2Reahu7EZfO8okOyHIlAuW3QlRbFFOIE7k=
X-Received: by 2002:a17:90b:3b89:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-38dc7779d6cmr17537203a91.20.1784214404991;
        Thu, 16 Jul 2026 08:06:44 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:38ea:b937:53f6:928c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e2a20a7c3sm1475506a91.1.2026.07.16.08.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 08:06:44 -0700 (PDT)
Date: Thu, 16 Jul 2026 08:06:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mfd: ucb1x00: Register software node for GPIO
 controller
Message-ID: <aljyxLKBI94TpleQ@google.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
 <48adc770-9d55-47a7-a779-cad73b587b83@app.fastmail.com>
 <20260716124052.GH1260374@google.com>
 <6dbf2f49-c1b9-448a-909c-7675ffdc928f@app.fastmail.com>
 <20260716140027.GK1260374@google.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716140027.GK1260374@google.com>

On Thu, Jul 16, 2026 at 03:00:27PM +0100, Lee Jones wrote:
> On Thu, 16 Jul 2026, Arnd Bergmann wrote:
> 
> > On Thu, Jul 16, 2026, at 14:40, Lee Jones wrote:
> > > On Tue, 07 Jul 2026, Arnd Bergmann wrote:
> > >
> > >> On Tue, Jul 7, 2026, at 07:01, Dmitry Torokhov wrote:
> > >> > Define a static software node for the UCB1x00 GPIO controller and attach
> > >> > it to the core MFD device in ucb1x00_probe(). This node will also be
> > >> > used by the created GPIO chip.
> > >> >
> > >> > This allows machine subdrivers (such as Assabet evaluation board
> > >> > support) to reference the UCB1x00 GPIO controller in property entries
> > >> > when converting legacy platform data to software nodes, resolving pin
> > >> > bindings directly via the attached firmware node without relying on
> > >> > name matching.
> > >> >
> > >> > Assisted-by: Antigravity:gemini-3.5-flash
> > >> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > >> 
> > >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> > >> 
> > >> Assabet should be going away soon, so it really doesn't
> > >> matter much.
> > 
> > >> > +EXPORT_SYMBOL_GPL(ucb1x00_gpiochip_node);
> > >> 
> > >> It does feel a bit counterproductive if you have to add more
> > >> exported symbols.

Just FTR: I completely agree. However Bartosz is dead set on not
supporting weaker references based on name matching and wants only
identity matching. So we export bunch of stuff and pay for this with 
tighter coupling and potential changes in load order.

> >  
> > >> No need for the seperate declaration of the struct tag,
> > >> you only need this if the first user is in the argument
> > >> list of a function, but not for a global variable.
> > >
> > > Are you planning on fixing these review comments, Dmitry?
> > 
> > Just to clarify, I was not asking for anything to be changed
> > in this patch, just observing. I'm fine with this version
> > getting applied as-is. As I said, the file is probably
> > going away soon, so let's just make sure it's not getting
> > in the way until then.
> 
> The 2 comments above sure look like review comments.
> 

Well, if this all truly goes away in 7.4 there is no much point in
polishing this.

Thanks.

-- 
Dmitry
