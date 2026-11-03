Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718736;
	b=UKS4zvoM3GR65y+Y1Nh1dL9CjBOGNQejkdSR6dIHRLuA1rGnEPQqEipLmDqfyn9sFfya
	 kz5Lcjvu98Ls/rUPlS2R1WikE4wJ6URuDY9LBkr9Fay7WqgodRlGYM9Ge3BKCmHJkBYXf
	 JjpIbVdrfv7hTVA71DxJ0a0zC58ncNkPgNy4kNa3Y8CM9l08PBKdH4jpiYOXtuwCfVkCu
	 qR2ckSy0rypop8gCvKyvajKkHBbcuWuaUfzE6DltxfLsnaNfWwcwCAluwevCnUJqWRgyQ
	 2p3NlmS2UhCTpMlpNHG8gdWZ1Og8WUY2J3XnwvyCRq/q9VQS0zWbN+I35M67AiBf4LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718736;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=Zba8UDgvOupp+mJLfkKzmKmg1o1us1OCczbPj5To2sU=;
	b=OqcB2Y6JI5NaJRNvCsm1e3N42jR4emenLzDsCsXPZz5wvpVSZLBpPargM73zoZ/SpN/c
	 dA1peiGKROTj42t+zRXDeK+fHVY2YFDeCDRBHkGQ/AQmv105/rVycAJBoYfVXET8hj0Mp
	 02KbToigHIgqhuoY7DFOtXx3CRWI9YZgcDY/YGvJMASzZ8FBUHkEgIcxdXtKbvpo95Bmf
	 hn1QvVPzuvew5gBKoTxq7ARtFc25JbVR5u34j/0SIMEFG2cKLAQXMYHcsPivR3CWGxuv6
	 SClGKBuhvQXTByPyOHeSh0j38Vo8GR+AItVk2Zey3IxKytsDtUWN6kaP0r7l+wijjoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjMjSy9H;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15945606B266
	for <mfd@lists.linux.dev>; Tue,  3 Nov 2026 15:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kjMjSy9H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4941F00A1E;
	Tue,  3 Nov 2026 15:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718735;
	bh=Zba8UDgvOupp+mJLfkKzmKmg1o1us1OCczbPj5To2sU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kjMjSy9HVtnHa0nxkEjmXuiL2Ok6TCs5raDcYHGgoYzloif4gkj8c6EF4qBRXxrw0
	 QqAms7hYi4OPP/HtQoT3hcDaZwL2uGY/lVWkta+r+DjMpozsMjlLtB7stBByHgcNzv
	 cXBzmOJsz80Qtwu/BQ2faCpz4vxg4Bq+M44ezc904zhfMhY7pkY7OC5k90IViL2Oh6
	 l38bDUnD6/dHrSVben5YtCEcUKf1Tbp8B1qwye1VC9FIEH1ns0TJTZMZqN14I5jqTn
	 FM8+pGHEQ+dHEAHUP9/AP3mcsKAw7pAEwHfgFTjpJAibDx+FkgE41v3qDU0yF8BPM3
	 wt6t23j6tuIyA==
From: Lee Jones <lee@kernel.org>
To: patches@opensource.cirrus.com, mfd@lists.linux.dev, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20261022075938.625795-1-m.szyprowski@samsung.com>
References: <20261022075938.625795-1-m.szyprowski@samsung.com>
Subject: Re: (subset) [PATCH] mfd: wm8994: Enable runtime PM before
 registering IRQ chip and children
Message-Id: <179371873399.1078893.13243475012454495090.b4-ty@b4>
Date: Tue, 03 Nov 2026 15:12:13 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 22 Oct 2026 09:59:36 +0200, Marek Szyprowski wrote:
> The wm8994 regmap IRQ chip is registered with runtime_pm set, so
> regmap_irq_sync_unlock() calls pm_runtime_get_sync() on the wm8994
> device whenever an interrupt is requested or its mask is changed.
> However wm8994_device_init() enables runtime PM only after
> mfd_add_devices() has returned.
> 
> If the sound card is already waiting for the codec, it gets bound
> synchronously as soon as the wm8994-codec child registers its component,
> so the codec requests its interrupts from within mfd_add_devices(). At
> that point runtime PM is still disabled and pm_runtime_get_sync() fails
> with -EACCES, e.g. on Exynos4412 Trats2 board:
> 
> [...]

Applied, thanks!

[1/1] mfd: wm8994: Enable runtime PM before registering IRQ chip and children
      commit: daf6dfff68daebc85deaf75c2fe403bac2b0bbde

--
Lee Jones [李琼斯]

