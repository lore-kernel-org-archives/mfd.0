Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357574;
	b=CbyGYiC5g59rRmWWOrJDxrmnRsB8YICfnvYSE8oUb9xlujIvqX6/m6kenkCG9Tt5lVGl
	 u4qGiOMA+Syz8F35CDnBuT+xVTonupsriXOgfsVKsTbCrw/cBAv7R6l4RcVub9+YudLsP
	 fKRdgYDMKxGHpwmB8gp/REOI1q+3Ohl2zh199DyGiLpvmgvMsUHyOxqzSPvmdvA5MAQP2
	 DP12BQwxTpzqQTD0XmGqQ5bNvHaecRvqrkzwSHC5Qu0kGxnjG93chScKMst8g2VUWURDt
	 mrapxg/2nJdlsnoczz5Q074gukcqrVnJhV3JlTpVo5eHv7HcIhHQU9rNfQLGhQYJ1tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357574;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=19UWKhVy2zuhB24lqtjvX1ge71thkeEw7AhozvsBUs8=;
	b=JOnDu4WwFopa1zDQbJyYNM7yTzltOvbJnbv6g46ESfB2KImBUUWv/M+Cx4ZPmGHZoCN3
	 oOupPHzHl5FvuhwBcio5u9uCmjVR9sB3OXF0fvxzP3lnMR78BhDniFE7DFeTvn9GfBqz5
	 s4XSekt3ktuVKjWH4PelGcNg+4FuF4gPKs9oeK6X6BW/kapKMCxePEUqaW5f74N6hcVRQ
	 gEPtLUPBG+t/b8lUdKbuELyKA7v7rUseLlm2qcs/EJyGDuVhPoJLwGPLoPYyNqkZJo9hu
	 LG2OWz+acYpJPWswyX9Jy/wolzhXAkMlEGCSrzLRJtgZLB6EMSZGJ4dTRU3k6R9Yk2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=3X8YCKTa;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE10C606B944
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 10:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE10C606B944
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=3X8YCKTa
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xMkE2-00000001FE9-08dT;
	Fri, 30 Oct 2026 11:52:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=19UWKhVy2zuhB24lqtjvX1ge71thkeEw7AhozvsBUs8=; t=1793357566; x=1794567166; 
	b=3X8YCKTakWHlX49MMK+ZykKXXeMtbMvS48TUb4/AVzGnf+o8M2q51vRG6Wgoli4qxBpPqbBOWcj
	ZGk9WyNJ08UwTqiJxAdSklzOEGGWxbTFqr6tWhMyQWnx+kyjZ2UOM3r05QUFXaHIKX/asHvlpGLjh
	TeyZqwIUyIOkT0Uc7yP8heHrtl8lGkyVZ45VJKGcL3suvvgtAIWjwoF0l/ZGEmZsMDoLHv28SNN5G
	NoZTUUYhgBNqE/8mh96qXgb3uc3qf0jOkyUNUxsKHu8trYB2eka/uVjNcQidPEXhhRHo8jM+swvYJ
	THKdAgKsIObDsh8p9PRXSEF89OPdPVCmNDXQ==;
Date: Fri, 30 Oct 2026 11:52:41 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Kai Svahn <kai.svahn@nokia.com>, syed khasim
 <x0khasim@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Samuel Ortiz
 <sameo@linux.intel.com>, linux-omap@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 13/27] mfd: twl-core: Clear twl_priv pointer on
 teardown and probe failure
Message-ID: <20261030115241.642c5971@kemnade.info>
In-Reply-To: <20261030104806.GC3774906@google.com>
References: <20261027093306.2812695-1-lee@kernel.org>
	<20261027093306.2812695-14-lee@kernel.org>
	<20261028165003.60d0c033@kemnade.info>
	<20261030104806.GC3774906@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 30 Oct 2026 10:48:06 +0000
Lee Jones <lee@kernel.org> wrote:

> On Wed, 28 Oct 2026, Andreas Kemnade wrote:
> 
> > On Tue, 27 Oct 2026 09:30:42 +0000
> > Lee Jones <lee@kernel.org> wrote:
> >   
> > > twl_probe() allocates the file-scope twl_priv state with devm_kzalloc()
> > > and checks for a non-NULL twl_priv at entry to reject multiple device
> > > instances.  However, twl_remove() and the early error paths in
> > > twl_probe() never reset twl_priv to NULL, a failure when adding MFD
> > > child devices bypasses twl_remove() by jumping to free instead of fail,
> > > and twl_remove() tears down the IRQ domain and dummy I2C clients before
> > > child devices are unregistered.  After devres frees the underlying
> > > memory on probe failure or unbind, twl_priv remains a dangling pointer,
> > > causing subsequent exported API calls to dereference freed memory and
> > > blocking future probe attempts with -EBUSY.
> > > 
> > > Unregister DT-populated and MFD child devices at the start of
> > > twl_remove(), ensure mfd_add_devices() failures unwind via fail, and
> > > reset twl_priv to NULL in twl_remove() and on probe error exit.
> > > 
> > > Fixes: 80a97ccd33be ("mfd: twl-core: Collect global variables behind one private structure (global)")
> > > Closes: https://sashiko.dev/#/bug/linux-73e82f84-94de-4d08-82a4-f22d42a1dedf
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee@kernel.org>  
> > 
> > Hmm, couldn't we use devm_add_action_or_reset() for resetting the
> > twl_priv pointer? Feels more clean for me.  
> 
> Nice!  Thanks for the suggestion.
> 
> To keep this fix minimal for Stable backporting (and avoid resending a
> 27-patch series), I'll take this one as-is and send a follow-up patch
> converting twl_priv to use devm_add_action_or_reset().
> 

I think the whole patch can be simplified a lot then, 

devm_mfd_add_devices can stay.

Regards,
Andreas
