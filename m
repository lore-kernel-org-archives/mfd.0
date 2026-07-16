Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB0C3BCD2A;
	Thu, 16 Jul 2026 15:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784216945; cv=none; b=j+2q7C+F7HernBqwD+XvgvBTR6OWa8d56rZimIH+MX7J/c7SF3gPibbKQQH/FGRh/K/HdfNJ3/bG/NPWNKpaLYOiccnyaia6ZIzkrpwKii9gp4vcOpDULzPvT8cWMl5DgYnXxMpgBVhXJkAr/GrUboGashgZNuCeNzFpEV8QuYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784216945; c=relaxed/simple;
	bh=uUr24iNK21GHp3puXUOLbLzhTK4TnrNBlaN2UKz9dSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Et+UWH1aFeMnMd2l1SS3CLVkX05lLmxv3J3hznomEduvZd4zgmDRKkG0cdArDpRZKfn//MFfwMlMMxFE2/Fb6dZEGoKShEUzYRl/DGj01L/y0a4yFuhomkn7aCPlv1STipTLqZmcmSzWE3/ijP4jBwPAY78WWtBk4YROvfuxrUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbsKZBkn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbsKZBkn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17AE31F000E9;
	Thu, 16 Jul 2026 15:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784216944;
	bh=bJLU/lrubaC+vq917sAe3mH07c3MNAs1YEwxcpsCkhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jbsKZBknYBcODm2mL4Jxr9dVOYgJYOXf3YX0c80JUEuiiN8GbNHEoRpTr6pZG4zDn
	 GSU87uUykrCXhAlcQN3aXv9Bd0JNxw/HpxeV5lEMFpUyrIdE/IXduvjxEAJx4g84pV
	 MEUmODwzBLFDCfXI+wNVspTv1j/dVv2W3XsjMosr8Icch472l/isodtLDnB4eY4TLi
	 5s4UWCxBm5R/IXOLXCCGj8/Vgy5jzOk0oghdaot7alv+/WMUSRsPCzPwyOyNt9KT9p
	 ATptIuPlw9G1K/U9YMVj/W+p/Ahystdd+rRTrObXMVvqULbg9zBoQGZEqigteCzKVm
	 XpBWowgk0cxMg==
Date: Thu, 16 Jul 2026 16:49:00 +0100
From: Lee Jones <lee@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@kernel.org>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mfd: ucb1x00: Register software node for GPIO
 controller
Message-ID: <20260716154900.GC1424265@google.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
 <48adc770-9d55-47a7-a779-cad73b587b83@app.fastmail.com>
 <20260716124052.GH1260374@google.com>
 <6dbf2f49-c1b9-448a-909c-7675ffdc928f@app.fastmail.com>
 <20260716140027.GK1260374@google.com>
 <aljyxLKBI94TpleQ@google.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aljyxLKBI94TpleQ@google.com>

On Thu, 16 Jul 2026, Dmitry Torokhov wrote:

> On Thu, Jul 16, 2026 at 03:00:27PM +0100, Lee Jones wrote:
> > On Thu, 16 Jul 2026, Arnd Bergmann wrote:
> > 
> > > On Thu, Jul 16, 2026, at 14:40, Lee Jones wrote:
> > > > On Tue, 07 Jul 2026, Arnd Bergmann wrote:
> > > >
> > > >> On Tue, Jul 7, 2026, at 07:01, Dmitry Torokhov wrote:
> > > >> > Define a static software node for the UCB1x00 GPIO controller and attach
> > > >> > it to the core MFD device in ucb1x00_probe(). This node will also be
> > > >> > used by the created GPIO chip.
> > > >> >
> > > >> > This allows machine subdrivers (such as Assabet evaluation board
> > > >> > support) to reference the UCB1x00 GPIO controller in property entries
> > > >> > when converting legacy platform data to software nodes, resolving pin
> > > >> > bindings directly via the attached firmware node without relying on
> > > >> > name matching.
> > > >> >
> > > >> > Assisted-by: Antigravity:gemini-3.5-flash
> > > >> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > >> 
> > > >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> > > >> 
> > > >> Assabet should be going away soon, so it really doesn't
> > > >> matter much.
> > > 
> > > >> > +EXPORT_SYMBOL_GPL(ucb1x00_gpiochip_node);
> > > >> 
> > > >> It does feel a bit counterproductive if you have to add more
> > > >> exported symbols.
> 
> Just FTR: I completely agree. However Bartosz is dead set on not
> supporting weaker references based on name matching and wants only
> identity matching. So we export bunch of stuff and pay for this with 
> tighter coupling and potential changes in load order.
> 
> > >  
> > > >> No need for the seperate declaration of the struct tag,
> > > >> you only need this if the first user is in the argument
> > > >> list of a function, but not for a global variable.
> > > >
> > > > Are you planning on fixing these review comments, Dmitry?
> > > 
> > > Just to clarify, I was not asking for anything to be changed
> > > in this patch, just observing. I'm fine with this version
> > > getting applied as-is. As I said, the file is probably
> > > going away soon, so let's just make sure it's not getting
> > > in the way until then.
> > 
> > The 2 comments above sure look like review comments.
> > 
> 
> Well, if this all truly goes away in 7.4 there is no much point in
> polishing this.

You can have the creds anyway!

-- 
Lee Jones
