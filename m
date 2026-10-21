Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585183;
	b=vPGSAJVJvF+EbZdjxM6dLArl/TGaH+U2bUSuH5XSn4z2YD8qYlkYG3G9Tqj99FwiisRk
	 jNjwwVTUXnesCkmdu1bG0kFLW6ZFHxlASCV1YWAY8H8fmQBJ87ug8KEIhj9lZrfNJ10r8
	 8Y1h9QZmtD7wVwU90HvZEXj+TvEykBoaooHKQ3UpJfuwv42jKrhiueQjgZ+N3jpHeXyUK
	 VL3Zp8lIjVeDzQkDaKxzdD+ErOTTe95yvmYb0wYn720LXrhLzjA3DxXDuk5uro/kNoXXp
	 Ug9UP8exCCkoNB/Ay2onOQTezy9GFft0EDg4XFOmCGGMm6btaJWqzBTLWaWKhLcLj3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585183;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D2WIgvLsL9mX149sVNYh2KDyf6SGJz+o+FC6r9bq+oM=;
	b=RquVjilHhSYagz1ld2ZBi8kLqceOZaidS0iGQ81wTLCJtQU5U9B0P0JOnW8jU/H3a4n6
	 OPqh3V/R1kLyB+CcCq7ABw8u+iox4aLjhaQhcFWadkMoyl5L/HdwlUoSobte7zREiOrxC
	 HG6gEzDXWQ+tR+YJWbdw7ZqM8Jhh/1rx1R5ugl3/w+ta3B4pH52WgOO/uHTxy4TpTwqME
	 T/PALRpMvm8MWS82idaZoyEyiD3DLqC968vWY03YvtOFdZiA3YWrXGjfgwLFpxI/yFyDZ
	 9dID53ekJjxrtSZpfNgZ6nag39asSglYBx5oLj6u36ao5ROooCafHeoplwnML2qFZ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvhLq3Xr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1225E606A31E
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fvhLq3Xr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8271D1F000C4;
	Wed, 21 Oct 2026 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585181;
	bh=D2WIgvLsL9mX149sVNYh2KDyf6SGJz+o+FC6r9bq+oM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=fvhLq3XrUuuMmLzWVL7Ro+Jg/Cdt7ffYeh/6Zv+8BDhnLp/kOBvWvJ0ITfBWJDsiv
	 CXYA82VK227JPZ6imsZhmJcdK6TwJ8W6gzmFi0nL9n7v6spdj5mKAVKvW1qgrSUa3Z
	 dkpk3GEbFXjKWZRp21OIIC/Y3Fpg08KmioL6uRClDUKncH33bLihSPVXuYTkWK5R2W
	 vpLcoDij7Q3+SgAGejvEaPG0iDfM4QloSfAYNcTKMAwfroZgbxEGlZOKIlZScpKJUa
	 MHxCVziLpIjQupVdDIKbzidSnY5FovRbwd1qw0wVjcvR43JGgJhSp3BrIJaP9Z35rc
	 +8GBeJ6cDfyTg==
Message-ID: <sashiko-outbox-180221@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 15/28] mfd: loongson-se: Check return value of
 dma_set_mask_and_coherent()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-15-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-15-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:19:41 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> loongson_se_probe() ignores the return value of
> dma_set_mask_and_coherent() when requesting a 64-bit DMA mask before
> allocating coherent DMA memory.  Check the return value and abort probe
> if the platform cannot satisfy the 64-bit DMA mask requirement.
>=20
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip =
controller")
> Closes: https://sashiko.dev/#/bug/linux-6685ee0c-b7ed-4f21-8800-cc705cec4=
49b
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D15

