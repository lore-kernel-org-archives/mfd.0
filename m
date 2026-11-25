Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613099;
	b=Vwo/RjHMuNngguc/XcIgl68dwqMH5/K0TU7YCvJWyj/gl1iVRGygL5pK9CJ6wa83Ciet
	 dtSGoCTjBjrR0zLmCWFjzY+OHEI9KJ9WwnX1w02EBzZLnHmdY2rmpmc8LDs/HsXOGXGYe
	 LrClwH48ChUOAKVkWYTXOwpMcKbosOYWYDpG0QFWzQnmCrsDrW/VYOpZIN1aBWye8d9ns
	 ZDY6XDmCRe7Ju0DKG0G7t6MiPerCu/FJA7D4p3xvBdOztQZ9MpH9RPJjHRjnSVc/gROoy
	 bH1ffx9/m9/uL40NmKEtLokTi1VsudLrYU9j2QvYCWvCuVI3aK1Gk1xCZxcFHD9R0DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613099;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=7lcFTJ+tdJ4VdMgxv0grZr3IXaKqL50BKP2nzFgbX8o=;
	b=IG7ogmy38gf0NgeBHJubIe48cnD41hRJrA9JFwvG/V17LU6TRyDAh5DK1A/K4oU9y3Oc
	 zpTTfnnOVS+jKIUUpI8/ApsIuC7c9PTkTtHyx+5VXdCQOWMwd204jBoU+KkUH9r6iMt67
	 dp9sgEsTqa3gMjtKGGwVMar463iVLzsbINkBcStvZkXILi0ZHVU202vyGb4+nNi80RWQ2
	 ncgtsSD36YaUnsU6iO1mrVs15ag2hFt8V4oMA6jJ7N/botaitMIKmfWK2bEaXeS3jJoUw
	 C4FCNaqoslVUAYnpCWlfj3rGqxDg21oQUxnJoO19AWIO9Nl1TRLthj+bYOlZWIkt4+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNqgJoBX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B35606A690
	for <mfd@lists.linux.dev>; Wed, 25 Nov 2026 13:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNqgJoBX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40EBF1F000C4;
	Wed, 25 Nov 2026 13:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795613098;
	bh=7lcFTJ+tdJ4VdMgxv0grZr3IXaKqL50BKP2nzFgbX8o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNqgJoBXE0pimfXpSjqy/1dtj566mIsjsE6BSg2EfZT5nJUt33jGP6LgDYFBai3qh
	 iVspJ7ocJzC7lgJyUKll2dIiv/b844TgKRB5ICvuVAlvh5UTCLhoPTUBuAC5WOAVsK
	 Ktt5MkVP3Z7DCCgPCuoSDDi41Hb79lfsKz8n8TrJKWbq7ur2Hpvge10K+HgQUinzyA
	 zzVDi1YwwxD2bAxhuDzR2MsaArkcIsTlEpyEsR5OfqigitZk7XfVZ23K7VcCC3HyTf
	 Ex7vg/bNb4d55gZaiiK7nzuWPTJl9aIH6UkzyBXMQk/8Uw0s1525ehduHWA22xnLZe
	 VJwoHeoWgJbLg==
Message-ID: <sashiko-outbox-233488@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: st,stm32-lptimer: add resets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gerard Marull-Paretas" <gerard@teslabs.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261125132225.90891-1-gerard@teslabs.com>
References: <20261125132225.90891-1-gerard@teslabs.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:24:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The RCC has a reset line per LPTIM. The STM32H7 errata (ES0445, 2.17.1)
> advise resetting an LPTIM through the RCC rather than clearing its
> ENABLE bit, which may leave its interrupt stuck and keep the device out
> of Stop. Allow a reset.
>=20
> PebbleOS, whose STM32H747 port uses an LPTIM of each core as its system
> timer, describes and uses these resets.
>=20
> Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125132225.9089=
1-1-gerard@teslabs.com?part=3D1
