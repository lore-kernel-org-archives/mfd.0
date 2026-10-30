Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379724;
	b=Ag2/8uEU8spT60pGPmL9aZnhzY55wbeUN5lpatnAUT/WL0o17SrFb/WwU1OHrcRAAJp7
	 T9819xBylP9sIRnn7UZUxVs+ZTIXyPsNzr4d7lgQ3KZ84Bzv4UUMUNKTaKw2/73XcTWqU
	 NnY43tsXJDJY95MS6+goPgVh2tNyT5/YG4RLlIz7DCwhaxVgrjXT/kRPWB8r8VLyDVJAq
	 ta4B0QgJPZv/GQ/xPgXJ8gYJTj3k8kLZiMT5QXBHRVNIXw34GSY9868tgR6Hyr0w8gWnn
	 Bwm7tuazGHKFipDPNnzwNOTLR7DB9NLdVwJJwFwUYsnmqx6rmXdSbXa74tJT+e2FcDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379724;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gzBCksUGpRgzdg0g7bf3tmsYSvu6QlN87dKZShAfXPA=;
	b=Wsns3o7v7WcGkju2fRRwQ+l7lr2fDLfK/ZmEPlmIHZp3lPBrMdy16Ul1hYgIsj6a+NYO
	 hf8XMaxY0L6BErQrBM7Gp8wSRRAOa4tguxEIuN1mZ/WXTSDclFP8mD6X3J1phF92rMH7C
	 YCmVaW0aUznbu+w2YPQ2M1lx125J3PP4tfAgPjIMFTbV1614KxWmNpEQNqU320sBkcLGC
	 QgnmZ1kFRXze6j9k7NymZz9DybNFM8MUDGsvI3Gy5wI4HdzyadcbxFS607CPGExj5rTMo
	 MHfSS4bYKzPG7I3xQ69LZdyUecgkZvXpPAy+qVIpmy8MDsYOW80bTCLeFmHGB2mvQgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IPkMyrAQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BC6606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 17:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IPkMyrAQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F293F1F000C1;
	Fri, 30 Oct 2026 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379724;
	bh=gzBCksUGpRgzdg0g7bf3tmsYSvu6QlN87dKZShAfXPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IPkMyrAQAwROliKY8YpNcdv/OfICm5KC5zBM84MiGTjnyiFaGvib1+f3VY2G6kGP9
	 Xv+X6+Q/bURO26kvrRPnrJh/35ACQOncYMjIZeoWgmSMPEmDz8IDdl4BvvMSCw0nIy
	 AAXyYe4awOFinZ+N98oL1VXXxxuI44QC3zp5SBZ/eR8GDDSYFB5ZWE+QYTT7oG6AmO
	 KCo5uZsdwOKo1LXj8wJnTOEh9Co59NAjoGuo8u7ggFTZpfoOhHSdbRKAX3ENrT+uMZ
	 /ivaAITvoO2rtAanBcUNjqcwAsvHhdxhI08Aa7JV//RWpodRYV2MHLcvi7wcpMCr48
	 ypV5okyeIfFvw==
Message-ID: <sashiko-outbox-191300@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] mfd: da9055: Fix potential use-after-free during
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <770185795ca9b919a9609a329362253befa6d26a.1793377422.git.liguangshuo@mail.sdu.edu.cn>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
 <770185795ca9b919a9609a329362253befa6d26a.1793377422.git.liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 17:02:03 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> da9055_device_exit() deletes the IRQ chip before removing its children.
> The onkey driver's remove callback then uses the freed IRQ-chip data to
> look up its interrupt number. Remove the children before deleting the
> IRQ chip.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 2896434cf272 ("mfd: DA9055 core driver")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI:gpt-6-astra
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793377422.mf=
d.git.liguangshuo@mail.sdu.edu.cn?part=3D1

