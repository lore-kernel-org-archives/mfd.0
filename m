Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793044697;
	b=vxAlnlSmTgYQnxCWf0JcE4pPbIbHmQN+aAK2Nmfk+MTR+wi1NGqxVrvMDoHESIPOzNHf
	 EtReJqcVs7XVi81v03QqZutJ/IguwYlpMibahfrH/Kt/tY499ERgQ+Ynt/xI5biKCgNZG
	 d43CdJygxAeYIolRd6o8m3VcKjXVwph1uqgussDw1/DA+jW2rOaszA0Mo1MxhJg/Q84X0
	 fImq47qKvycOhLMRL+jL5OkH+vqxAKvksmDSfsRfFiiMbWj5YfXkFvl4mS1OaASKmWjkm
	 NHU4BuQ6SLlbGrh5rI9BMI/9631Ho/tCt64kUBmJSIR+gzFnADifLFDtoHurIzTublg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793044697;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0MJBURpKlr67JcBda9O/tqxBXjRsH3w0cNpSHJWCUpc=;
	b=gT1enp6RsV+Lo2JpGICWiA3/x7h/bYcLalRnMC5bNNixmO/oGAYcH4PGocOr84v72Rzm
	 3C1qfi9hFatzkD4RtXceU7iDF8AF0tRWfXj6bpUfZCu+EKBuLC/sQvDSKKoxol1k8f94Q
	 YgcC2oRvZOgnkoF58wnu0WuLT76nE51ZJ1Vlem4YAXyPSccT/Y9jSNglPnA+ziVyzOZ7Y
	 VuMvPs5fNe6UmY/Ph2oHVzEbljepvlfejtYeHOTQkLfLCzCDK0EHHA73/0ZtdN5B12HYL
	 V03riBoSzC233qCm32wxLU5d7E+KVpSgiS9aHaK667zV55Ox7KQZ4JIyDjPGUmhYMQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="UoYu5/Hw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57535606A31A
	for <mfd@lists.linux.dev>; Mon, 26 Oct 2026 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UoYu5/Hw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A9A1F01825;
	Mon, 26 Oct 2026 19:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793044696;
	bh=0MJBURpKlr67JcBda9O/tqxBXjRsH3w0cNpSHJWCUpc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UoYu5/HwEKVkXNgia78dSmkgZkC+o1PDrJX3BTECc/h4w4CaP1y3giQ8TnkrLYYQY
	 mCUIyho/qs+OtA+hFPYAuwbDLh3E8PnCgpAxZqmnbecRS+ZWffmOimvpIMt1NuoqUE
	 73/ZweXKyJy9gbvTBCOYAxWFqjUJCrRlaHVJ1w8wRDgbymwmv4CCqTCyD4SQZXK6yV
	 Ts0RYj/L/dkevmvi7uMrQKMZ5zy8TdSabYV5pVmRVS51GbrBzr5/c0XvivxbBlzSGl
	 EP2BUlnnH1Ch80miL2ZDW7UMzQDUKKdzBm9Dlo7+9WAPoEvs4ivR7Ngg/vkB5NH0Kt
	 xPBkMD4Rr0V1w==
Message-ID: <sashiko-outbox-185696@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: twl4030-irq: Fix a lock leak in
 twl4030_sih_bus_sync_unlock()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bart Van Assche" <bvanassche@acm.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <8aec913c6a80c26c4cf5a1ce590f8439c997dafc.1793044546.git.bvanassche@acm.org>
References: <8aec913c6a80c26c4cf5a1ce590f8439c997dafc.1793044546.git.bvanassche@acm.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 19:58:16 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> If reading the EDR registers fails, twl4030_sih_bus_sync_unlock()
> returns without unlocking agent->irq_lock. Fix this by jumping to a new
> label in front of the mutex_unlock() call. This bug has been detected by
> the Clang thread-safety analyzer.
>=20
> Fixes: 2f2a7d5ef764 ("mfd: Drop twl4030-irq's edge_work")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/8aec913c6a80c26c4cf=
5a1ce590f8439c997dafc.1793044546.git.bvanassche@acm.org?part=3D1

