Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585429;
	b=U3OejveiVm2UEr72UxuAIxsFGFYHPZW1shE50151MrW9pNBAGk7HaEVntnc15kJ1tNci
	 U+vgVk104Z1PRYVFe4nMPCrboMs8ljYTxkOgI4DMIy704jr47P9uL7ZLu2Oc2TC4JDdY9
	 ASrPcmQFvICQ0PwAJZsNLKnmL00geMy/uldtHmhhKuVInjFcoHtIgKOHGmuba6nyLGt4D
	 cCoP5C4OYB8i1pPtVqyN5ukdZPD+oSKANUuRVYRaAh8Yn99iI0VTJ4reH4ALsDlEpbDfJ
	 qEUNCcqVWr/yxdqtDfayujMoEmLkdeIggSeDhVGvajbH/v/UTQvYom5nlrBIYi4UgXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585429;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=d84IUFEGmWLJRtOdCo5Oly0qbeaiInQgUuifPAXoop4=;
	b=hyPgMGFpo+n+E+Jc+Sxq8WMNxXIdGIq/5YOTthH8Scy/LdUqCVc8KbCiwRYo2ios/0tm
	 g++9jXqpyzmu98v2AibXqvRQPI5FVoNl8jyGP5kfprqK+DUCXuQgZ9oy1pyVh/3ajqq2U
	 AjVopIz+X1D2XmNbfLMiSfTUn1d5CeKc79rlUWIsUURBQDFq0nRtGk2baSzRCxK+gOIxL
	 zbVFZK0PixIomXyvT3MwcbKz+QdHGpTcZP4TgF+6U81ZDyNT8PX+CwcfD/N//bbthd/1L
	 GZqF2+0PLDTagz+iJLAh7gcNaevk0SkmRCMmGeKO1QPpgf/AnOjH/sR5H3bBd676pVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hrhvc0Jy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C87D606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Hrhvc0Jy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8561F000C4;
	Wed, 21 Oct 2026 12:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585429;
	bh=d84IUFEGmWLJRtOdCo5Oly0qbeaiInQgUuifPAXoop4=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Hrhvc0JyODc5ehDXbnLmek+J155+Nt4HnI2Bkx821r7BSVYxCEwZ76L1NzshUSfDl
	 /27joJK/e31xJ8pdBcC4MsPErmmZf6YPBzziP+EtpGiOQlhLXzFCBqGupfpC8mnuRh
	 TVCyQIvetI2S2hpB0SZyuYttcwKqxfd7Y6R5ubeUp5nhioTnD3QgEa4Vqo//WeMWGV
	 DQqZjIsI5FSYNu57CvS4VS8LKKoUWouXw+P6tONIbnv3luiNjk9Wdt6OC8IuR+mRBy
	 Sh2AYezQIbcAdBGE2iQTwPWIhu7WUX2xhTXkCHO4XZwj5+275vy76eW3QSVUwuRW2q
	 NdlMOoDNjnjIg==
Message-ID: <sashiko-outbox-180242@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 26/28] mfd: mt6397: Unregister PM notifier on probe
 failure and unbind
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-26-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-26-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:23:48 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> mt6397_irq_init() registers a power management notifier block embedded
> in the devres-managed struct mt6397_chip via register_pm_notifier(),
> but never unregisters it if mt6397_probe() later fails or when the
> driver is unbound.  Once devres frees struct mt6397_chip, the dangling
> notifier block corrupts the global PM notifier chain and causes a
> use-after-free on subsequent suspend or resume transitions.
>=20
> Check the return value of register_pm_notifier() and register a devres
> action to unregister the PM notifier on probe failure or device unbind.
>=20
> Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
> Closes: https://sashiko.dev/#/bug/linux-edb62fbc-213a-49a2-be55-c002e234e=
554
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D26

