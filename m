Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794869427;
	b=ExwUHVNynnMd0MLZRofc3SUyDwMqMvSsWj9UtfpD0BLteIv93ItJWHiyNn0YaYp1clUS
	 W4+NV4JxCSL/FFgIStz2VeFOM9iOzVwJbf9EfASeKM7QC5vbrbAmzFN4oEc0kQK+6NhA+
	 n4WcglDIfpyfEbzeTVWc1m4DxnifREyqGQDZfpyoMYHKI6DjVj0E8r5WXNFgNN+PSH8IM
	 7VML85MDDnBTzE93OxOARUsKYNVfjxYFZCcyIK0b8MhPOw/rnwyaSSNa7xzU4H/m2Uoop
	 anDTHZfd8DjDvCoPrymDQJoPN81YljRNFCZXA3XoyAuEy7qB4yguW1CSnisJZxFlj+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794869427;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uyHBWTn0s9BbtPI+B0BfUejv0yYcf/R6co77psU5Eb0=;
	b=yjMkBEUTwP7TBcpTXk4L4xjqTxVvsGiQp75dg4+JYouppyRI5HL+0vJw/rC3olFH4wiU
	 aPB2dLCrZ4QHJl+J3JngB7T/BGzrm/d0p9wwxJw6ys2xrXL/74QrfKCggrTWzvXzi6gCS
	 gK24sPNzsgQJvLaVkyIsYPS9xCU6y5jsm8HfFAXETaiI2Ok3BTzqt0vqcqFBNqTSX2upv
	 ZpAnB9Q4wie9OvCp+q9innavvFRecWp/VYUCfM5Nif1SP0yHWXnoskgaNaFjFr9JkZTQw
	 6VA7k+VZbV3qQHml1ZSOOdoaffCK6rZiyu6CPLAVL565SHtaZcV0AUffBlLPnjjuHtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="W/5J+aXD";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3139606A31C
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 22:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W/5J+aXD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5593A1F000C4;
	Mon, 16 Nov 2026 22:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794869426;
	bh=uyHBWTn0s9BbtPI+B0BfUejv0yYcf/R6co77psU5Eb0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W/5J+aXDCTsPor57JakLYgCW2wjaDMZM1PNQQAJsmPTaWhlZgVjXFUy6iLNFpuKat
	 9+zPfgPq0H+Licm65b0uP01zX5NgATPHv1lROICeAY/UkPE/oUrkynS48XoOttPeFs
	 SH8wKRs0DZ5nvMKdwVbrfZ6DTmrWSSkMEPNzhM9k+mLusi+djRM0Uwe2Sgbxqnx7yr
	 uDt+CiFJXmeLikLtTeuvNOyzj9MIVVQ0Dahwqcow57ke62PfjmItvgoEW5gUJL21HN
	 yrk555zBKHuhtohPcpzjg7qMXN9gJfGgcygaHkL7ZnE4pBfPKMhVZZ2UIQUQeRImbW
	 3ZAHdRginm7Kw==
Message-ID: <sashiko-outbox-217814@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116224803.61154-1-festevam@gmail.com>
References: <20261116224803.61154-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 22:50:25 +0000
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
> detection and sources 37 through 44 to channels 0 through 7. The DTS
> lists these sources in that order.
>=20
> For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
> 15 to the threshold interrupts, sources 16 through 23 to channels 0
> through 7, and sources 24 and 25 to buttons 0 and 1. The DTS also lists
> these sources in that order.
>=20
> Reorder the schema descriptions to match the hardware documentation and
> the existing DT ABI.
>=20
> This change was prepared with assistance from OpenAI Codex, which was
> used to compare the binding with the reference manuals, existing DTS,
> and driver ordering.
>=20
> Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to jso=
n-schema")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116224803.6115=
4-1-festevam@gmail.com?part=3D1

