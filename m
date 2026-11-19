Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096507;
	b=f4G3ZvcTCJKiC3FxzueCDzKoCnnj9er4brC7HcWmhs3CVa8TrwVnPcVJ06VTA/Kx0hKY
	 KehjA/2hadb90i0xmBfVdJ7lhUB3GAPdriwmnND59QkydD10FpimUiS0XYfVDm5BrObCv
	 00wbrBvdTPsucCH+BDszFBrDUcuM9JHIBWifJnaAvqGWsb9lawCGFH0qfQwo9x2Zr3JcO
	 nWSEdmqys7vGVKrs9npHKADXBYNV3gayD4bKoPNfI6QR7RpcHv6MWi2QV8s4xBE87UPly
	 xELrUPkQMGVqYRwp9f4iuq2S+QocKjmYfFopsCb7sXam5XSR1eNRmLK4zOXgkQ5qk0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096507;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q6SSdoIU0aLQaWCyuDyP8TzLlV1057/4Tvvs68EH9SE=;
	b=xUYgOpOe5OcG18rxkUqf7b00YWNdXJW64c6bKXBCVWJW/DeUzJYgWek81ilkEjUsOXU1
	 GwMT9w4nJOx1aFENitlSZpAZHiaiPaVyUgODE3yMI4MRPMg4U1JyqYXOpeL1HtePROCwv
	 LusUb7JiCJtHWpMxMA4brzrdCmoQjxGY8aH7ZEMyhDvEeS87tgbzFtthOeE55NIAdHODC
	 LoilWiRwhloGotRUXfGhBHPGQ0OUY/IRpq5urTlJae3UXdgJ/xYyA/ERb2LBxFcBC25Jo
	 jHiH43UEd/N9Dp/Ukf4vLcLizJ5MxPgineJazVo9pwSRr72sbHiY1xFLku+AUTDMRtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2o2CMPN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B247660A263A
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 13:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R2o2CMPN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 589331F000C7;
	Thu, 19 Nov 2026 13:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795096507;
	bh=q6SSdoIU0aLQaWCyuDyP8TzLlV1057/4Tvvs68EH9SE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R2o2CMPNYrYGxmJaT/H6ouno857vObBh+iUeKWJUXsQbc2i8aQh0DiDgfPKlHXq5N
	 0qJv5YNmYPp56DRQuukgwe2pfdiYiG97eqnOiA8lAUscUoXGVGxLtsfkKrLs9FHfQc
	 NdBkBX+ExzFEBz16NRimTfswQdr3uZ9CBzqWIlfpuH+Ee1/YgZaZStfCZjWeDfXC5q
	 odn72en5+M9zifv0xrCH8B0lolC61Vcw+tZotxJkOX3cJcNOd258IpbQHGd96OWw2K
	 gaZsSL1ZGj43+F60owCMX+kqP5KD3CeKOtvHwGEBS97kJ21KXFDa4dS6audYbioLQt
	 fZ9nPhI6wxpbg==
Message-ID: <sashiko-outbox-223221@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] mfd: MFD_ASUS_TRANSFORMER_EC should depend on
 ARCH_TEGRA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <a26023673d5ff120812f67aee3728154694cb69c.1795095742.git.geert+renesas@glider.be>
References: <cover.1795095742.git.geert+renesas@glider.be>
 <a26023673d5ff120812f67aee3728154694cb69c.1795095742.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 13:55:06 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The ASUS Transformer's Embedded Controller is only found in Tegra-based
> ASUS Transformer series tablets and mobile docks.  Hence add a
> dependency on ARCH_TEGRA, to prevent asking the user about this
> functionality when configuring a kernel without NVIDIA Tegra SoC
> support.
>=20
> Fixes: ccb21236e307ff60 ("mfd: Add driver for ASUS Transformer embedded c=
ontroller")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795095742.gi=
t.geert+renesas@glider.be?part=3D1

