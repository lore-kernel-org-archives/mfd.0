Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E836330D35;
	Thu, 16 Jul 2026 14:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210432; cv=none; b=YYSfroLg+6ZTnWBmPcTomaXerYH64GFcoIr5+8d20EAOU53FxghueZgXrpmnSCo7XXyvo7Vl8kmiobJ7tm5fUwlZfeqQrse6BnoyYY5iYlvr0xxUcqaFff+RABy1wPFXIIMcmGQGXd0ZooPQgnJEMchQxD6Ghq+T647zIo3qfOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210432; c=relaxed/simple;
	bh=KuRYcXNJoaLMUabvdbYfGmupsU9ecbKcZH6ee+inj4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4OIf/TYGLsRWHsIxahGf5BZV24qL2w1MXHI9dtFWm3BxQ3zvxe/zN5GtiAUIrbA0LiICXNem0k/XxCo6nxrc46VqeiTB23fnDn9NS5OMHXzPh29EXh1iqlsNvWQu/84miAz88LQyMHGMqetY7rYcx639VEKRSpP+fIDVkfU7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GBMXDQLP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GBMXDQLP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79A21F00A3A;
	Thu, 16 Jul 2026 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784210431;
	bh=cVOwgk0OZrLKgnZBHlbFxaHq6jr/CSfUmUI6y50DrXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GBMXDQLPjLmrIPJzC+tyeMx0qnyiaFwnw/z46hL6ydbDQLIKuVcAzpLvansOXmC7N
	 GycTU4Za2RhYHP89fzMgMzs8a4WCqpGG6wg1Jk37Bg39vxmGfYff8Q7J4c7haStwLJ
	 7A6qGLX56soykwo97QVuNYwTlRcK3+FrVhVzbleEyNV+ms1gSSkglZS1FJJeDXKApy
	 yCBuHwMt7AGV1iFu0XFJLNIC/IpdWvFHPyLtZHhpzALdgalRPmwdux/6TKOwBT2YfU
	 ngIU6Hu13e4qdlW4ZI15wuSRuPqc3g1HK3o79kTje/JAqKBSBbVRoonn5DtYM+LC5s
	 bg8cwQ9F9IXCg==
Date: Thu, 16 Jul 2026 15:00:27 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mfd: ucb1x00: Register software node for GPIO
 controller
Message-ID: <20260716140027.GK1260374@google.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
 <48adc770-9d55-47a7-a779-cad73b587b83@app.fastmail.com>
 <20260716124052.GH1260374@google.com>
 <6dbf2f49-c1b9-448a-909c-7675ffdc928f@app.fastmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dbf2f49-c1b9-448a-909c-7675ffdc928f@app.fastmail.com>

On Thu, 16 Jul 2026, Arnd Bergmann wrote:

> On Thu, Jul 16, 2026, at 14:40, Lee Jones wrote:
> > On Tue, 07 Jul 2026, Arnd Bergmann wrote:
> >
> >> On Tue, Jul 7, 2026, at 07:01, Dmitry Torokhov wrote:
> >> > Define a static software node for the UCB1x00 GPIO controller and attach
> >> > it to the core MFD device in ucb1x00_probe(). This node will also be
> >> > used by the created GPIO chip.
> >> >
> >> > This allows machine subdrivers (such as Assabet evaluation board
> >> > support) to reference the UCB1x00 GPIO controller in property entries
> >> > when converting legacy platform data to software nodes, resolving pin
> >> > bindings directly via the attached firmware node without relying on
> >> > name matching.
> >> >
> >> > Assisted-by: Antigravity:gemini-3.5-flash
> >> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> >> 
> >> Acked-by: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> Assabet should be going away soon, so it really doesn't
> >> matter much.
> 
> >> > +EXPORT_SYMBOL_GPL(ucb1x00_gpiochip_node);
> >> 
> >> It does feel a bit counterproductive if you have to add more
> >> exported symbols.
>  
> >> No need for the seperate declaration of the struct tag,
> >> you only need this if the first user is in the argument
> >> list of a function, but not for a global variable.
> >
> > Are you planning on fixing these review comments, Dmitry?
> 
> Just to clarify, I was not asking for anything to be changed
> in this patch, just observing. I'm fine with this version
> getting applied as-is. As I said, the file is probably
> going away soon, so let's just make sure it's not getting
> in the way until then.

The 2 comments above sure look like review comments.

-- 
Lee Jones
