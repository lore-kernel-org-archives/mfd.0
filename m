Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983620;
	b=0Zl57UC3YbNNxoZj23P2CWzYATSeuLTNa2tbMqUuCOhrItKRx4Vqk3MOudvoc1J8JMEb
	 AZcNysi1yWbBt49TFNwlWbRm60vawBApR6TuSGHmYU36LHzCUfNs2teJHnZ80nYBahpie
	 lUXPFUyqogvNNSdiKYni1sajTktU5o0YtLYht8+GduhTVrwyP3Bfr+4GSjfJ13r7AFuuk
	 U/Qqw2l/JL3c7zQyWOoCoseaINZ8rpkQbyeimiQTThqwCaxjQ69olZTaZOAP57gv0zdHA
	 k63vTq8Nq2M88MrOw64DZ4vRuzdABrbNpKaWP6hV3w28+V4Ab3SbdozoZSSDSCgPj5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983620;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=og6MkvXhBV5/zMaDx0kxs9K9xRcWdE426MFuj606Y0Q=;
	b=jAl18m6n0/qYHkPcgsxCLcP8jUaH3SXe47fJAwKYcRQVqkjGrJVXI64CQOhYyJs3RfYv
	 VQogBgEPYNI1KSeH/h7s3AgTqIOa0ADLSD3A4lYkvrgc1aEt4DKdT82fgM8RexHBAtNbT
	 aGG6cfSrJKYi2QyU9XGkGdra6A2GRhKVQGgADKPPXfVDE2BbQWtvfvEyRjOMhYQONVrH+
	 O9ssydj4h8NYzGR/JgWZOqp50oozCSKweMNX1C3hA0BnOxrN912CIGOA0ja7ziC/ueoth
	 AI8JHu00lS0ODUAgvzszVhbWUORVBuEvHyUsmPuEJ5fhCjovNfx0LcpwbSwyOMPG5sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b72r5Tld;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B5A606A32C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 06:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b72r5Tld
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9669F1F000C8;
	Wed, 18 Nov 2026 06:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794983619;
	bh=og6MkvXhBV5/zMaDx0kxs9K9xRcWdE426MFuj606Y0Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b72r5TldRJbolTSgh9O5taWshTKm0pbL1hsX8uN13S5UxSRL58pnFcB7XAUsMB0Sp
	 NXFOqevKB67G3pm6PDojQgntA+UrpSegdB/fo4TbdumKIELSLs5nqc6T+aKEjBDrz7
	 3ZJY7aeYsnf2HGSytWUI2ZW9ja9PpQ7tDg4F+Q/FpAbqqFOWVSho4FKjyE1e8RACNI
	 kzEJWR3B/9w0vV06eHznKBRDi3FL2IKDEQhsZ/vjX08AGb65meYPcQrhMF7h3sKm1s
	 aB8Q59BQ72vxVxFoZJumVWSdHHU/DTjY6xlc61J2xIO7cu1kr+XmRxjV/29dza8AGg
	 PVcnpDrNMyO/A==
Message-ID: <sashiko-outbox-220255@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: cros_ec: Drop OF node reference in
 ec_device_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xiangwu Lai" <laixiangwu@cmss.chinamobile.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>
References: <20261118062949.1250-1-laixiangwu@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 06:33:39 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> ec_device_probe() calls of_find_compatible_node() only to check
> whether a "google,cros-ec-ucsi" node exists in the device tree, but
> the reference held by the returned node is never dropped.
>=20
> Scope the lookup to the UCSI block and mark the node pointer with
> __free(device_node), so that the reference is released automatically
> when the block is left.  Keeping the lookup inside the block also
> preserves the short-circuit evaluation of the original condition:
> the device tree is only walked when the EC_FEATURE_USB_PD,
> EC_FEATURE_UCSI_PPM and ACPI checks already passed, instead of on
> every probe of every cros_ec device.
>=20
> Fixes: 17f95281839d ("mfd: cros_ec: Don't add cros_ec_ucsi if it is defin=
ed in OF or ACPI")
> Suggested-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118062949.1250=
-1-laixiangwu@cmss.chinamobile.com?part=3D1

