Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB312456E0B;
	Tue,  1 Sep 2026 20:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788293878; cv=none; b=WiKS/opYfhLqFaUgk4PRJEHxpvvTqLZGj4NkIEgvxpw7bssYw75n9oU5/JRb51+mVsToU3vhExEiAfeDO1u09qDT6sGdbyScsi2dByA2W7DKWhUhRx2OzKdsgfgCKa8GiTh/S/kbilHGl0/Fi5GlDcDqaCNjbMztDVDwYUY7HO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788293878; c=relaxed/simple;
	bh=AW1AT38H5b4VdYXHf25+n8vQYIvj4gGmNhjQAUwIHY0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s+DYlp80UWf5S/+2oehlPaXWJK3fLR430l6+ux4KmPehGPIuts41geTKiimVdQx5eBcF7E0cpqDtnYk/i8O4/U+2LNyjxS7Wn9ymk+xvrimz8MNd3lOzpNv7pV3ceXb/+8We5qhOzSueTev836XgE8iVTqEIRIiAWq87KWLGris=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kDWnPOJs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kDWnPOJs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382801F000E9;
	Tue,  1 Sep 2026 20:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788293876;
	bh=AW1AT38H5b4VdYXHf25+n8vQYIvj4gGmNhjQAUwIHY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kDWnPOJsNcYmUzVC+T+uqMKEWHJWVHSLRHoKTacQVophl2nySyAOODliA32xGYIx2
	 NGpDd3FGPSfeS/8MP2/OG88Yf7hD00rcbSe81PhpCgD2q5yCQFPrGp3ukM3XRM8837
	 qi6GPF9HIlMQD60eThce4qJdbiBsrmvRsneDoami4Cc/ZBpkUnCT7b2dDN6fcf07u1
	 26+6xQYCOXn69jjEyCocOgHZj7ZhmO4DVBXKVovY4grYOIlJQ3qh+7nH/RlUsV+cOr
	 43c4u+VMsUVyI77b13ZOqWqU53JbEl8PlUBRPkd7Sxbn63kJEk9YdXgkYY9Y3cyrfm
	 qjNMRt6DJvSHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/13] regulator: ab8500: Treat cut 1.0 VAUX3 as
 fixed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-4-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-4-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:17:55 +0000
Message-Id: <20260901201756.382801F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The early-cut workaround currently gives AB8500 cut 1.0 the 16
> programmable VAUX3 settings introduced with cut 1.1. On cut 1.0 the
> selector is not programmable and VAUX3 is fixed at 1.2 V.
>=20
> Register VAUX3 as a fixed-voltage regulator on cut 1.0 and retain the
> 16-value workaround only for cut 1.1.
>=20
> Reference: AB8500 User Manual, UM0836 Rev 3, p. 240
>=20
> Fixes: 2b75151a1041 ("regulators: Added ab8500 v2 support")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D4

