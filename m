Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7129480974;
	Wed, 16 Sep 2026 13:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564862; cv=none; b=CSoVuRycaWqb2ozCF+AfC9BNyCetbbzw97E21ouBC9CWJC1E+J89lUnFz2t3/MtrT/FApjI6Ow5j8v/+sNQWIxonSBOCDLKL6XlS7h8H4P7a5BpGdu7RCiSBtO19wX4BFtrRN3qvdU0GY1TrddaNvRu2o9BOG6YULQb8eC9ff7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564862; c=relaxed/simple;
	bh=CfNaouOH8b2PW1Oy0e+KOvdVWFh/RRi4RS1X145tmZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S2YYBPCm+kK51IyNI9oHg83GiqQ9nHxIwB2addpXsZ5IuEV4dhZY1JzlaEaeQB23i1GaPFQMAvqf0PT2WNYfKcvEcDF++NH+/05aCliphR8DANkUTNOXTYpPYTTMzWw0w7ADoLmtKCdGEVaWslBfjx6SmyVlNvDIrrgdcufR+ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsH+kot3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsH+kot3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8CC1F000FF;
	Wed, 16 Sep 2026 13:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564859;
	bh=CfNaouOH8b2PW1Oy0e+KOvdVWFh/RRi4RS1X145tmZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UsH+kot3La8Xu5H0I9EvPhaCRxfAbr4bB17QR7HT0muEVhiD2/TCPXXj69qMTFb+k
	 wjCylwi6uFV3TiBpg84AxjfA3gTlNaSBJYRljqspw/RPsJ6pG4n8tSe1YOmN+83ZZ4
	 3e//G/RFMjVvPhleiOON+3pjHbPFZB7bsaR7SAK6JPyjgZRIDMBnNGvPXU+VEqggm4
	 DotXzOTLr0IrQiiBUU87C5HxEnj8YIXacJeIgVqylIXxatpkdIfAmSsN7fUtAkEXjz
	 ebvtMZJSt2jmt1ScKcyCPxo9l+5F9HMbJs/FIH04/sxWvhOIsUd5XDjooRiGAnvldg
	 2J7oa3JxOJoMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] regulator: dt-bindings: Reference Tegra
 regulator coupling schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bhargav Joshi" <j.bhargav.u@gmail.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org
In-Reply-To: <20260916-ti-tps6586x-v2-3-f12cfdfb446c@gmail.com>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
 <20260916-ti-tps6586x-v2-3-f12cfdfb446c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 13:20:58 +0000
Message-Id: <20260916132058.AE8CC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Several PMICs used on Tegra boards TPS65910, TPS62360, and MAX77620 use
> Tegra-specific regulator coupling properties. Update their dt bindings
> to reference the shared nvidia,tegra-regulators-coupling.yaml schema.
>=20
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-ti-tps6586=
x-v2-0-f12cfdfb446c@gmail.com?part=3D3

