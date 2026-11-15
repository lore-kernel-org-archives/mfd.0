Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794733729;
	b=sLBwdQJol+S80wjvXN/qeWqwg3NgmXeBpHNV0cXxUO02kgRcWqfYStcG69C2pklTZ2y1
	 bWJidJkuYFkMotsfGhN9AKaCylF013qCAgKsWBPU/Rx9H4IftrbegrkeAZLfHkVJF5dsl
	 uklaKxYwTwdG3NFeMX5PcPa+kuiUB92s68xlZeoxlrFzTrNtdzikiXClwBHVWD7oYrCKM
	 TbRc2UGMDCFjTepYUkJI5kLKUBscxbdQTPI79u8vOL3roDWxztkFbIzK7XlRpgthQuoRj
	 +DdXvCANdzPgxoHqF2IKJOXWQij2ucTwTOvD8zxj/kNOYzf2Ifm9E35baYY4VpYvnxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794733729;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Or8kFfknom+zi+GUhLvsh0nUsUpWn5HmzIdaHXpTNK0=;
	b=WXOkNIWrlpq1qWa9dtQm1R6pQIv7ZJJVmp84weiA/2aW1zImi9z/Zxaxzszke9i2YN5n
	 7CzhyX7TwBK8bnj+YfteiQgqcausa/fzi5Lllq1WG3BuRi5r9UiNVtmwGR6/99lnVB1g2
	 ANvl6iIPw24EnxmztvMnknr/WmkcswYC5HAcYRMmEL5c0AObIa5Tpt5LwXGN7+f4/UTvR
	 zUPdmOOWMV82qGB/tApdOFv3eJFuRJz4ZdzIMQFmLM45pp4h+oiD0hs+fFMmUAM52aNdG
	 2MUDQhAbDzNpF3J18ZPMVFvSnpI/6rXbJrMhnZiNRxx1ZCwkcEWcYmr3llsOW8wxu8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOrPfseK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD996606A31E
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOrPfseK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 685631F000C4;
	Sun, 15 Nov 2026 09:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794733729;
	bh=Or8kFfknom+zi+GUhLvsh0nUsUpWn5HmzIdaHXpTNK0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aOrPfseK+z8XbUJRuyHnqGPWiIVLERdIUbSpoE/m9dp6WnjkGZHtxW8cbvsotoxun
	 R4HRJTRqHz0Q0kND4oAieSxeQTEfHbugDe1mGBxpJAUFcUEYI9mAnpVa0GIPrmzB0z
	 ku5I2iZ1fX2wPRhsgz5oHRdZzmJM8qXT1LRaMlzF7/RssuaSoNMOWdF61Qc2tDjx92
	 qH2whOxkUjmICdzCJAQoFihnjXMsjzC44cDNTpw+5rUV8sH4b8AqjcFnu+E5mxqrGC
	 2tisjwLqvIacyGmyhpDfSnb01NgPMiCYBuGXbJ76Iw9fE7rO260e2k9xoREmVQ//S/
	 tmGICoCfkKzGA==
Message-ID: <sashiko-outbox-215328@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] mfd: max8907: Switch to resource-managed
 versions of helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115090147.95337-4-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
 <20261115090147.95337-4-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:08:49 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Switch to resource-managed versions of regmap_add_irq_chip() and
> i2c_new_dummy_device(). This involves probe refactoring in order to
> remove jumps and allows to drop the .remove callback.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115090147.9533=
7-1-clamor95@gmail.com?part=3D3

