Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A93C3803E1;
	Sat, 12 Sep 2026 22:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253710; cv=none; b=PpLC5ivaTlSoR7RGWllYO6lR6Cv0pvOUdIecQv2Jdn3aelDyUNA1TirGpfcdjbbPh9+VxVk2Ab2dk9BzOpfESc7jbwOgKXnZZtd019j5bnRjh5OYKRUJtkZUZzsOYYpqx/zyjpdxXqJTSfm6hFoRaRFtWS11jlfwEyxIsgknh40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253710; c=relaxed/simple;
	bh=naIjciVoyXl4tYcvq98A75NFz8qwiVM+8P8BPQ3ShAM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qYIuXJLiKIC3lDKjgyh92BVemTvmV7cWnV3Q4HyWVlchF4t1I5yRrL+0ESevjf6hqLXnMA5Y+buwt3LuZVouOd2euTd3Gl7+pz/6fdeFiEVYD/+xsKMYg9/9STS91Nyf8m4ojnLW9TkjcWdQ4XUy8QRMHutt0zQl/Kl4/YlX3z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2KYh2YW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2KYh2YW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8A91F00893;
	Sat, 12 Sep 2026 22:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253709;
	bh=naIjciVoyXl4tYcvq98A75NFz8qwiVM+8P8BPQ3ShAM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e2KYh2YW9+6FN+cRs+tfT/G/7Z+PVLQOT/QTGgRAXJwtqRApZDbdi9nze2ZDuj7lv
	 6L3k1Z0/6xAIE9uqwqzUimQ0lXc/GWDF0bq8E/GJg5wkgNSFbCaQFD/jqyol2mMdzq
	 ZBYlvO9pK+dzMh4LhNuuRNC78co1e2J2srtqe4yiLeE0ONGz63Wiv6FnhdL1tGwIsE
	 MEjYo4eGyRdZyFS+a/qCwIpBPcf6Bk3YpLC9puBqEIn8lQ8Sd70sa4S2xNkTQPN+VJ
	 JzvW1JJirzP8Pnet4JcjMT8v/35485HdWIWxu4QwN9pBuWfMWcaNyKqgOHveOhGFEL
	 C1Rv6jsUEf0pA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 2/9] dt-bindings: net: Document support for
 AN8855 Switch Internal PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260911225414.225980-3-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
 <20260911225414.225980-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:55:08 +0000
Message-Id: <20260912225508.CE8A91F00893@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911225414.2259=
80-1-ansuelsmth@gmail.com?part=3D2

