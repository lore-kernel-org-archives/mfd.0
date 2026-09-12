Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD0D3803E1;
	Sat, 12 Sep 2026 22:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253707; cv=none; b=diopJ/FP0q2TiGYcQSjJOx92bVCMB/GqtGLdcsWxjA+fDgZ37raBOdlhHLzRTAMbY+W2zApNX0Ar2Yf3cCcfvSehQfWQX6mfbUIWggXXqIZwrqSPZ5ZVQ/DCxtG9u35XAoDqDIuca4y5qWCe0oqc8ZZ+Ws5M9LjYJNtk1eIopno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253707; c=relaxed/simple;
	bh=VI+QyrFBBdnapDx+Q8qkHfKfV4X7wEA3gHHFggJF3cY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Lq2B52zPZkCF++3W2wkMKhPg6+ow0qXjQrMopKmr7sWR0Z/iDWBLqwYJ70lV28KfA8p2kgi5Vtd4KYbqbcExIL+O/4mOT2HDnUiE2RnXOC6YNgLo8p1xDUgYN5Wrq21qIMVFoPnRvyQgjWoZfqj0SBVzaTCopyCtDdlyI37goqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuR2UCnp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuR2UCnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5311F000FF;
	Sat, 12 Sep 2026 22:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253705;
	bh=VI+QyrFBBdnapDx+Q8qkHfKfV4X7wEA3gHHFggJF3cY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kuR2UCnpw3WKbrEmP2Z7xCxBC42B3YmGyqEQxXBFcXWXbm11yAsNXi3KnZxdbZyl0
	 4D9wZ0B+v5IpYN1pBDnfqS0mdIgclGJH4UpnsU0cyxVclvDsbG/YyRPuJ3zgvGGqHY
	 om+c2nG1EswXHQR53+xv71G6ugpyGM1Q9KNqeHzXLTgf/osFOymqfgWx9HkiQ5FANk
	 8e9VbuWeyHFDwnZLyv1YC/oFRKbLZyW90/s92Kf1z7UJZfFx9c7NlXrHA1e/W63lJ3
	 lAjlNLP1GUW8LlEpoLKy/YcltRw3vTyyvLNsKgO4w/xIZA//rUusWBGnhg9iNTbFWm
	 DrYo48uwr5JGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 6/9] net: dsa: tag_mtk: add Airoha variant
 usage of this TAG
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260911225414.225980-7-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
 <20260911225414.225980-7-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:55:04 +0000
Message-Id: <20260912225505.4C5311F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add variant of the MTK TAG for Airoha Switch and comments about difference
> between Airoha AN8855 and Mediatek tag bitmap.
>=20
> Airoha AN8855 doesn't support controlling SA learning and Leaky VLAN
> from tag. Although these bits are not used (and even not defined for
> Leaky VLAN), it's worth to add comments for these difference to prevent
> any kind of regression in the future if ever these bits will be used.
>=20
> Rework the makefile, config and tag driver to better report to
> external tool (like libpcap) the usage of this variant with a dedicated
> "Airoha" name.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911225414.2259=
80-1-ansuelsmth@gmail.com?part=3D6

