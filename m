Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDAD44CF2E;
	Wed,  8 Jul 2026 12:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514282; cv=none; b=uzcKF2Wbxt/0EF0D3mOk3ptpYGn2ZiAO/Tpv6SC8uF8Vrs/IhhkQqBTiwdoGOzYQeX2/iDvfQ+AW7NJF6VA7WB71HIJEdFXr3y0KbyF1v/HBVfPwpXkg63RPYeDi1PLG+RegxV371DClVAM8q3WCgj864KaP0poSarLqP0RsYU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514282; c=relaxed/simple;
	bh=svy8XFgDNcBuMvUvY97ctkog14H4k8CMmzHtynY+NPQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dq4ARgeK8sOidb8jw6os5n+GGEp0dJ9HPbALaCIkHgLRaHPfP72KorFdVWUaYeRXZKPArId734LIi2VGlgRLru8yL5eAHY38CvhnPl7CAoEGVgd9zrPe0d7dDY/oPhrD2p90OyEfKFli4pWWxDYuSF2UZo0ggVI+hJ/9Bz6FVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQXi2ruZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQXi2ruZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073191F000E9;
	Wed,  8 Jul 2026 12:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783514281;
	bh=svy8XFgDNcBuMvUvY97ctkog14H4k8CMmzHtynY+NPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RQXi2ruZRz3VWxdl96dvhKEQn9Lbkhflo7thSvTkmVX6XT2jnFkASs9PfxQlpYqGB
	 w8JO83whEoK8bjwRFTYTjZpirIl/l3PTk+WlBF8XG8oGGMd8gNPOIi47wblxPuMhmv
	 7Kjqi6lnrOt3/12/93SfQo+rEiJHrD72FP9RRDDdTJt/OyHQQf07PCkrvrac+FJEh+
	 MusRPnZrxlofeaRa950ZDzsjSqvYHDD5RHeNxLV16szE7r7W7KdcgpXBsNkfIquX7l
	 oj6UhC0blqp49Sx73Q1uGaCAx6s74AVGfsDsO2dGYvktCJxMv+Sj+17Hl2rAizsTPv
	 cO+DCCq57ivNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Convert OMAP USB TLL to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eduard Bostina" <egbostina@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260708123328.1768794-1-egbostina@gmail.com>
References: <20260708123328.1768794-1-egbostina@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 12:38:00 +0000
Message-Id: <20260708123801.073191F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Convert the OMAP HS USB Host TLL bindings to DT schema.
>=20
> During the conversion, ti,hwmods has been made optional to resolve
> dtbs_check warnings. Modern OMAP platforms do not require this
> property, but it is still required for older platforms.
>=20
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708123328.1768=
794-1-egbostina@gmail.com?part=3D1

