Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585366;
	b=LX5f8GNR/faYXY7a4g71I1BTfgkCo7UxDk+8mS8H1tbayN84KHAKmxvE3mjAh47f4oji
	 Sd7T7mZWHMpF2x/R5sN6tZZD+Q8hAc4WEmCCm29xO7Thfa/oDGEfTavYKZXZMbqEZTbA2
	 G/5xl9H3a/2o34FptsvPxrZBB73drksEia9x8lyrAVgsk7fdG8rQSYih8xBQD6HNbI1DH
	 DrUDbsRkz1lGgItR/EKjqckUduL9MlSkAUtMfVp0TJL9tiJDjXod9b4xONd9KWusDzZT2
	 xm7mV7YjXnB+qMSMoJf21jjnOoXTQW9fTRjPRsN4unjL7TkJ7WrA96phKspiChqIMOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585366;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IRAXyo6dXcluuElv9HrEFFNfDyYx4ZDQ1ma8CVtj5j8=;
	b=jfZV3EYgTxZzC0U+ji72ja+B0n18wfNd63OsXY+bwUY6wEU6Tvv+HHv9RQaddKevlOvc
	 qeBMy7OkgX2rroGjgjtQEXeA9YKbnGU5qjW9QcGDCQkUTDHR92GealofSaq4Zmm6eDbib
	 R3UoPR3OZBKrEtC8CTHdvO4khM2blnfw3r4ZneRTWQO56tizRHKCk8JjUUrpo+5MPp1bo
	 2ifAGNNu7mt6h+wdzvN1fE71l5MGfp5TaWsMN5JLPr23TwJ4LG4oMk+u7hdbGRTzMHvp5
	 N1RdxMYz5918x0ayrN5m4j8bWS329MmFDh1sbl3uXHbjZPZI0X5/GaMq02BUIMBDIAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KU9kkHSd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359EF606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KU9kkHSd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEB7D1F000C5;
	Wed, 21 Oct 2026 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585365;
	bh=IRAXyo6dXcluuElv9HrEFFNfDyYx4ZDQ1ma8CVtj5j8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=KU9kkHSdbTVuExNdybbGcQwxXZhFJKNR+wsjyprWQBNUUBNMjYwJvyno2vkNJDgdT
	 IFSAKv9pvBCT2Y9C6IpRmLLSNjlD9M2J9klZqWG9AIqD9eTgntIxo0hs7dERpdv4eH
	 lyStja6w7nPNzGdCe2e/zE6/X6Oh10zEiLl3+Cy4Mvrz3MZ6TBrgOCNWq0UNYFEjRQ
	 PuaFaPH7V8EFwYy1TwXhfiplIQLnlKpCmQMhj/KohIZjv0M92bZio8Df8AOq24Qiiq
	 Sp/j3RHRACYRySPOQVDa5i1BGcldfZZD7E/UUhqG9BlhPtsjM+d4nleQwCf4XMFI/P
	 C4tmYeNQburWg==
Message-ID: <sashiko-outbox-180238@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 21/28] mfd: loongson-se: Validate engine ID, DMA buffer
 size, and IRQ registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-21-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-21-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:22:44 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Harden input and error checking in loongson_se_init_engine() and
> loongson_se_probe():
>=20
> - Reject out-of-bounds engine IDs and engine 0 in
>   loongson_se_init_engine() before indexing se->engines.
> - Store dmam_size as u32 to match device_property_read_u32() and verify
>   that it is large enough to hold the command buffers of all engines
>   within engine 0's data region.
> - Propagate negative error codes from platform_irq_count(),
>   platform_get_irq(), and devm_request_irq() instead of ignoring IRQ
>   registration failures or masking -EPROBE_DEFER.
>=20
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip =
controller")
> Closes: https://sashiko.dev/#/bug/linux-89bf25f5-ecd9-40e3-bb4c-bd26d07c5=
3a1
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D21

