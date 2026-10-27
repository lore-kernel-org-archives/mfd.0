Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072258;
	b=nphupljOuvS2lTX1ctZqjJSA8dSfKCvuEgbugLLXdeiGwf0K/3T0QW6jQqgO9RZr3DfZ
	 Hu5NcqcW36qj57BS4PkShqUqmtxX+6xxvdg2X/NILt5h0Uj2gsn/Ah9fBmT/lqPl6wnWc
	 +mHQY03096uSXq7uTs6smH+Nf7h9nbQxY1JE8T5AsvgWLS8cCAeSWQDqoxTvr9IHuH4MZ
	 RRxMmr+d5yCdYIQyfV0JdAF4Bm2z/qM8TyoCBDD6wjZJk1au9DxEOUNsOenqVKArjbchb
	 SWY12JUtN0DqLQsFtEd/1ZqZP8QB6x8b8tBo/AOfJ3tZ4d4ZK3lTMPe6/8yZIIMo5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072258;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nPXSGSBZGZ90t+9pV7ld0SIwqlXMZ0hKy2DHTbJP7iY=;
	b=wGwuhMb2cAGvEEp+2DLqPyOyVxb8G8nxv+XFIeTew+Np1GeRFLhtDs03/quBmGHqBz3s
	 XKqqir5ZtF5RI5T0WdhN9jG/ft8/6anSF5HL3P74qjxrjdceXpLXKdJFEKNxtntqAIMWY
	 bcQWc8psV0C/secQQfEss2/uiTRWYyg1YZmvwNj5KZSD3gvKiASFUjajnjPzCLPYigCJO
	 NZKql/HOxRk3XSYB8OzUYh3P/csInZRKIITpGZkX5OtjN2n9cmGnh5LnFM/VLNZZdygsN
	 o9snk0vKdTIfpRpEJ5LDVmU8skrowaw80K2ENBjH8qI8Yjsj3YRGvrr8cR1oVqAhgyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WMC+/kXm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2FC606A31A
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 03:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WMC+/kXm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B4D1F01825;
	Tue, 27 Oct 2026 03:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793072257;
	bh=nPXSGSBZGZ90t+9pV7ld0SIwqlXMZ0hKy2DHTbJP7iY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WMC+/kXmSSu3wSXzD5+h3TJSy/IvbjLmhQquGTJIwWrX1sys9LyeFDBU7DD+Gejmq
	 43vyIaktbmNYSLat6V1TptjaFwXsQuSgQ6ymllGp1ePAHX5clB4KBEVVSGKWWPXzl3
	 vd9311PjRu/EbxE/l8XQjESa/HZK7M8iGzkdlIX0YWxm1Xy9rkB/M/Kk4IwV28GsWk
	 pAHsJQsOfdsZ8rYUKlQZ0ACoOXIRWmC7KeLGCYVTF+b4GyrgYsQAwAFjepemGamP0X
	 edLAykc906g5Yrz4iaNx2464mbTA9Hwwl2o7aSx42qoZwA8EA6RIWxBtS8TQfI7eVC
	 mEq3CLeWKhvrQ==
Message-ID: <sashiko-outbox-186056@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: twl6040: fix IRQ action memory leaks during
 teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <lgs201920130244@gmail.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261027032609.119226-1-lgs201920130244@gmail.com>
References: <20261027032609.119226-1-lgs201920130244@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 03:37:37 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] mfd: twl6040: uncapitalized commit subject description after prefix
--

commit 8ed2bf2661be49ca78d760d94439552c3d69696d
Author: Guangshuo Li <lgs201920130244@gmail.com>

mfd: twl6040: fix IRQ action memory leaks during teardown

This commit updates twl6040_probe() error paths and twl6040_remove() in
drivers/mfd/twl6040.c to remove MFD child devices and free requested
parent IRQs before calling regmap_del_irq_chip().

>     mfd: twl6040: fix IRQ action memory leaks during teardown
>    =20
>     twl6040_remove() currently removes the regmap IRQ chip before
>     removing the MFD child devices. This destroys the IRQ mappings
>     before the child drivers can release their interrupt handlers.
>    =20
>     The parent driver also registers READY and thermal interrupt
>     handlers using devm_request_threaded_irq(). These handlers are
>     normally released by device-managed cleanup after remove returns,
>     when the corresponding IRQ descriptors have already been removed.
>    =20
>     Consequently, free_irq() cannot find the IRQ descriptors and the
>     allocated struct irqaction objects are not freed. The associated
>     IRQ threads also cannot be stopped through the normal cleanup path.
>    =20
>     The probe error paths have a similar issue, as they destroy the IRQ
>     chip before the device-managed IRQ handlers are released.
>    =20
>     Remove the MFD child devices first, then explicitly free the
>     parent's READY and thermal IRQ handlers using devm_free_irq()
>     before removing the regmap IRQ chip.
>    =20
>     Also update the probe error paths to release successfully requested
>     IRQs before destroying their mappings.
>    =20
>     This issue was found by our static analysis tool under development.
>    =20
>     Fixes: ab7edb149c75 ("mfd: twl6040: Convert to use regmap_irq")
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

[Severity: Low]
This isn't a bug, but in the MFD subsystem commit subject lines normally
capitalize the first word of the description after the prefix. Could the
subject line be updated to:

  mfd: twl6040: Fix IRQ action memory leaks during teardown

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027032609.1192=
26-1-lgs201920130244@gmail.com?part=3D1
