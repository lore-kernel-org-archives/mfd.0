Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533700;
	b=4k5pOc21/+ViFWl4ufx/CjJfs6YUjX9MrR3tQyW9dgE+Dv9PgUxZWS0yYGxa+/WIG1F5
	 VHIBk+hROQgIXuWx91D5jPcUnd/V3l4ce4YxuYNdtTPeXyirkbkhU1dwNsW8mKRPGsQgr
	 8IUciyxn8aN4n6QdhyH1/3ikkJSN/YDetS4wR4Eoy9U08Oy0FsinUzFG9FqvR9ktpk+2f
	 PuW+3peuhB3x6UkkJAyYIawGhzeYbrd+Xp99JRg/RHUW1bqDlfO/PtjHtWBapJJB9rAR4
	 RYcv4lzpLoqPA8pphdRQi2wfaUMwrpeDtmyiXIOdl23okvPgVbgrLAsllY/kLWnqtNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533700;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HDfLhLcrt+MKTWt6IH0usDrZhzRtxcL+fQyyrkfMw0w=;
	b=Sj3pcYaz60rBCtGETlRiC4OYzPwL3RwlQID7iKcJnHoQIKJcDUNq1GzEUJGqMLWMmZOv
	 uF0A/67sphfOgfnyUXQVQcl0QYlepakf+hOXCRwsOUd96iSxMu6M5uFn441rPAvHAR1Cu
	 sYu5DhOueQcSJDwjTsmW4tKRVOBVFdeO405njFbX2vmsPDrTETsJfZO3dpLSDpyoYTnbY
	 CeX/PbY2ybaIe9lZY0Eao7tSeVIkScbfgBhLpYNHNcW3w64sQ8wZjlhOxdREubNf+Lb8C
	 QCuB/AqWFKS7+SM0vC2Zpe+YGKrczO/Vez0yCciy8RCawcXKa7M7+d1lj9qL+Qb35cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se24fwzF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE94606A31C
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 01:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Se24fwzF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3181F000C4;
	Fri, 13 Nov 2026 01:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794533700;
	bh=HDfLhLcrt+MKTWt6IH0usDrZhzRtxcL+fQyyrkfMw0w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Se24fwzFpO4r5JbBVx/PxZzfAkMiSWr21bFlO1uQJBEikmEvnMG/hc42ERvr9wEvy
	 9JcVbsrujdTPjVjwCEVY8+wkRAIyvapH6eGh1KG7/D/wDxbfW3BmdTTj31CVUxMJCF
	 RzUjuHF/VEeYcFwpg6AXDJ2D5UXYmPzJaWnLU0cEh/NeQ28hat2KY+MUmSlBDgbSSL
	 zEu1T6LKkyfhwLdOa2kRauby0gCekGGxXl6yKn+6tDOUkoYsUab0MwWgffLSS6D0Lz
	 KOFaCkDavR/5UbR7juoGcsThwl5ty5bYu1kv6T/m5oCH90zsJVdQNcp57oEclcYea8
	 2PpL0MQIaKUww==
Message-ID: <sashiko-outbox-212067@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261113013212.470981-1-festevam@gmail.com>
References: <20261113013212.470981-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 01:34:59 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The interrupt descriptions added during the conversion to YAML do not
> match the ICOLL source numbers used by the existing DTS files.
>=20
> For i.MX23, Table 5-1 of the reference manual maps source 36 to touch
> detection and sources 37 through 44 to channels 0 through 7. imx23.dtsi
> lists these sources in that order.
>=20
> For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
> 15 to the threshold interrupts, sources 16 through 23 to channels 0
> through 7, and sources 24 and 25 to buttons 0 and 1. imx28.dtsi also
> lists these sources in that order.
>=20
> Reorder the schema descriptions to match the hardware documentation and
> the existing DT ABI.
>=20
> Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to jso=
n-schema")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113013212.4709=
81-1-festevam@gmail.com?part=3D1

