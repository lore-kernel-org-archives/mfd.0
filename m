Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A93471279;
	Tue, 29 Sep 2026 19:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711551; cv=none; b=m16N34Xm2847E9XsahuPWIcRSxESux0JfkqGYbRKotSoOre9W0CaiAbcq3JiCm9+WJpj/fTlmLoPH2ujZCJ9OdLtFdVNdylfsnI11Srau5behU8SqaXap3AxsSn+fPU0LP5EfRGGQfXIIA5LKHnTzqAcKR4rcecaV0OVMxUF5z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711551; c=relaxed/simple;
	bh=KaZxwfM8x5SKnJ4bUV/e5XNYAybNPN50835dBvDpMpY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z+05BVEn6pKQaySHNmxRAzjJowXIh0pC8PI0r35Mk4Gn/TlxqNpPYJJMJRaq2hfuttXyvfoqM9W4tWPYPdDe6LX7tJ0g4c4JjdlPqVi2VE98gmxSvXOUOgbF20TwMh4DuJnhlVwOxlI59A6+0lYD0+nvsjIyZoEqsxac9X0CXZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EWuFW5ak; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EWuFW5ak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6FD1F00893;
	Tue, 29 Sep 2026 19:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790711550;
	bh=KaZxwfM8x5SKnJ4bUV/e5XNYAybNPN50835dBvDpMpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EWuFW5akogy+oUpkF4lDlRZsYid7SIf7a5yV/4fNPhYihUmghjfnqTKLssoxbHpYK
	 z7HpF8c18+VShepoFcBQ/59HGfwwpFcMbCRUO80tubIST5tRAQsC+VeZfvyUt57Q0x
	 NrQymqZiKrS3C7hY6irvp6Dy5kIvpKjKmK5ltP1czoXEdsYCwHVrVss61G2N8NNdhu
	 Z8/woEW6OHwxoumhcH+uO7OSYx3L6k2wSK8QROR+IrSXOvs5KE2WyxTvIjW8Dfimxi
	 9u5idRNVbQ4tyMMTS1de02NrMhEMczWuiVT6ryToaDsWjCQ+0KatY7hBE3uCqwilDF
	 4zDvSRIR05jrQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v24 02/10] dt-bindings: net: Document support
 for AN8855 Switch Internal PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260928194511.41878-3-ansuelsmth@gmail.com>
References: <20260928194511.41878-1-ansuelsmth@gmail.com>
 <20260928194511.41878-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 19:52:29 +0000
Message-Id: <20260929195230.5E6FD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for AN8855 Switch Internal PHY.
>=20
> Airoha AN8855 is a 5-port Gigabit Switch that expose the Internal
> PHYs on the MDIO bus.
>=20
> Each PHY might need to be calibrated to correctly work with the
> use of the eFUSE provided by the Switch SoC. This can be enabled by
> defining in the PHY node the NVMEM cell properties.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928194511.4187=
8-1-ansuelsmth@gmail.com?part=3D2

