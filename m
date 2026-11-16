Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855707;
	b=R0sUKWmskWgyGJMSr8UADaRpVl+i5DGjr1ueZc/BZ40fMwIurGG/RdyU7wwAGkomDal9
	 7F2tvuB5ftqoN2hQH7VFbVTqlN4af+hUzHyo+koegFhWEfqOQ8IocmpTZK208GCu5rJeX
	 Qu8wvx5P17/m6vtctseQ30A5pNd5SMOGRNqIrDGY16DQmtxpFxY0EIxLQyKnCN0yPDDGA
	 zZ+zX8/nvGdYkbQ6IA/Sr09dnsYEe721oEnKbrUMXPYN0kQ54AAAfcEcGfNiF2cMx5xAb
	 77lrl2rAw2uVlksdPsBMWfyQ5zljAnloohKfnCSS4TDX5SouRZ4FnyBCCBbD6w3/+XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855707;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WJaIcJVOz+KxkqUz8U3R8CEk8xHPOG7YE8ln2ASlz3w=;
	b=3ZKhLCH66y+0XkVEE7tUQgNVXKsKrAKmNBA6q7akHNU4jAgygGTyrGy/Rx2C0EPzFG3Q
	 t/+RiHU/9tFlkFALSuRRxXBd2Z79YQu1gtSIA7JrNJswRIHuha0P/4yoIpcR23XhhtiIZ
	 9vlhClpbWugXgrbEUza58aCaSREdZo22ILZ4UnIrnUJ4W2xKxfOpPYGu+J70oTftWzTFy
	 1h+A9uIEOED2ItwZ+549H/JrYnNrAr9yVHio51mLudQe+J1ywFcj1PksTGuu6q4/L9VuQ
	 DPQr5jQcsbUwurZRJXe8iCMtHgGu5Kw1PXkDojjQUlPdyQAyJqNp4tlhEeLEA+rBVSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MpZBdGnd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A0C606A329
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 19:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MpZBdGnd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FBF1F000C9;
	Mon, 16 Nov 2026 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855706;
	bh=WJaIcJVOz+KxkqUz8U3R8CEk8xHPOG7YE8ln2ASlz3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MpZBdGndSs/vcf5kjR3yFAPMuQh9wnzqsu7waop5E2tNxzPaWY3nsEcj3ti/HINbF
	 4IPWvy7MFZQkJnmERJ6NnhY7ybx7VUNpFGtcvrpgnYwfD9AQw4VTqyty6VXIiswUNC
	 hNc+mOIM1QhnsW01MCyGYaurWsyh+S4Ej9WEbMsSser1uJPchXSdAzu4j1AvlSH6sW
	 AQ4b6Q0dOpnpgqNnHVHFAKBI2ojv5J//NykTpYdF+zoG52XbKi6yCrbZ9cQ4WzZw78
	 7OOy9Xdt8XGqosMqaMw2HaZDvkzqPLjF4LgIu8AT+GQxBX3v/6S0rbSkBtv9U8/ILx
	 a1qMSupCmyL9A==
Message-ID: <sashiko-outbox-217521@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] mfd: tps65219: Correct the MASK_EFFECT field of
 MASK_CONFIG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chrispine Tinega" <dev@chrispinetinega.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116185811.1907811-2-dev@chrispinetinega.com>
References: <20261116185811.1907811-1-dev@chrispinetinega.com>
 <20261116185811.1907811-2-dev@chrispinetinega.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 19:01:46 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> MASK_EFFECT is bits 6:5 of MASK_CONFIG (0x25), per table 7-46 of the
> TPS65219 datasheet (SLVSGA0D). Bits 2:1 are the warm masks of sensors 1
> and 2. Nothing uses the macro yet, so nothing has written the wrong bits.
>=20
> Fixes: 74c17a0a49a6 ("mfd: tps65219: Add driver for TI TPS65219 PMIC")
> Signed-off-by: Chrispine Tinega <dev@chrispinetinega.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116185811.1907=
811-1-dev@chrispinetinega.com?part=3D1

