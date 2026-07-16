Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF94F414A0F;
	Thu, 16 Jul 2026 12:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205657; cv=none; b=P7/h5w8miZqKWRs8vNVq8JINTSbX9r8QZIr2NhyAZauL/FycogKp3nDs1qkWFt+3V0/NU951UvI6xxu+F8qJXc8CzRM+IgGRxLCwXns+5hhwiI2DB1NKNXUYXwrp3h8PNa8hgcZ8VA9NVfHV+3njG0MyzZM48eSzMzqNwKgljIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205657; c=relaxed/simple;
	bh=OYZLvJs0n6wg/Kc0wlWfBbv4Eb5wbOIoz+ru3Whoymc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JailxPJr6qf4Qd/xLeeaxAr5B7Z0x6q/lJIn3C1CbbyG/WV4c7pbFN2UGGp0ngVbs/loR5hXGvoHWgsjE9Mv9bqmm1xCkZFVs89ZpIxuySVFL+eP8MrUB6VWQM1dMU8XrYooCiUUYEnIoet89CHhCsUuHS5flxlXarV+Fvm4Q+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4T2vNdH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4T2vNdH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661131F00A3A;
	Thu, 16 Jul 2026 12:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784205656;
	bh=88Pw/52c6xXP3vps3LZ3oRxuj2Nb9tLMwYYxzxQCzh0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F4T2vNdHo05V3OCMkQQI6xLW/Nzq9mZvK8vzKAUjm0dqHf+3qyQahqIl7Wi6/h2d0
	 K8kqEH7wIqZ1yoNCoVn0bOKXUoOHWeYtQrz6u/J++nE56wBxPmh4cuqjZv8u80oPu6
	 tiigZXSO5vJVA5qFNmXioysUysMLmTpDpeEKLGG/Bu3Lo9y1GgK9I5CP2oZaBJ9b2T
	 Nw/0WcsJDD65Nk4jc6svS9f1whr9cH/z7cOSWz74U4NOcsWl5koAPotcEwVT7dTWg8
	 feHZLEFjHdq0ApxZT+jqHuWlKb6ex+Q5mSVr0JxtQ+8nd1SvQZ8H37wOhDkoFVwP+0
	 TzyzDqI8IotxQ==
Date: Thu, 16 Jul 2026 13:40:52 +0100
From: Lee Jones <lee@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mfd: ucb1x00: Register software node for GPIO
 controller
Message-ID: <20260716124052.GH1260374@google.com>
References: <20260706-ucb1x00-assabet-swnode-v2-0-e6271ea3d3dc@gmail.com>
 <20260706-ucb1x00-assabet-swnode-v2-1-e6271ea3d3dc@gmail.com>
 <48adc770-9d55-47a7-a779-cad73b587b83@app.fastmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48adc770-9d55-47a7-a779-cad73b587b83@app.fastmail.com>

On Tue, 07 Jul 2026, Arnd Bergmann wrote:

> On Tue, Jul 7, 2026, at 07:01, Dmitry Torokhov wrote:
> > Define a static software node for the UCB1x00 GPIO controller and attach
> > it to the core MFD device in ucb1x00_probe(). This node will also be
> > used by the created GPIO chip.
> >
> > This allows machine subdrivers (such as Assabet evaluation board
> > support) to reference the UCB1x00 GPIO controller in property entries
> > when converting legacy platform data to software nodes, resolving pin
> > bindings directly via the attached firmware node without relying on
> > name matching.
> >
> > Assisted-by: Antigravity:gemini-3.5-flash
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> Assabet should be going away soon, so it really doesn't
> matter much.
> 
> > +const struct software_node ucb1x00_gpiochip_node = {
> > +	.name = "ucb1x00-gpio",
> > +};
> > +EXPORT_SYMBOL_GPL(ucb1x00_gpiochip_node);
> 
> It does feel a bit counterproductive if you have to add more
> exported symbols.
> 
> > index ede237384723..214c71a12e84 100644
> > --- a/include/linux/mfd/ucb1x00.h
> > +++ b/include/linux/mfd/ucb1x00.h
> > @@ -103,6 +103,9 @@
> >  #define UCB_MODE_DYN_VFLAG_ENA	(1 << 12)
> >  #define UCB_MODE_AUD_OFF_CAN	(1 << 13)
> > 
> > +struct software_node;
> > +extern const struct software_node ucb1x00_gpiochip_node;
> 
> No need for the seperate declaration of the struct tag,
> you only need this if the first user is in the argument
> list of a function, but not for a global variable.

Are you planning on fixing these review comments, Dmitry?

-- 
Lee Jones
