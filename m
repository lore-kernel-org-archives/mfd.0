Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBCC30EF63;
	Wed, 29 Jul 2026 17:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785345396; cv=none; b=kqFLvDIuPNzWNXNgOMXE6iTZLYlXyZTqjrjR1Kvb61nEQ8ygSZCV9ZIAftyTSr0ZJ+7HcWILg3hjHXvLkv07/5RWuIaDVDAIi9YkPj/1Gg2FzyAB1wlNCxXeGatrMMgMmgRHXcSYyjOChlsZaKZEg3QE1FEZQNCd7hYfjumdtuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785345396; c=relaxed/simple;
	bh=r6vzkDoeWi5qg+sgoONDH7joLwFrcq+gbKtV+WuJNgg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i9kUJKeX7Iu/Jx6GPSJqnsu9asWmvQ1zwDuNjf+Rj5fFID7prRRYxbt2xlQnwIqzXSThl4Q/NQ/iTTF88wj7L9EznckTedBTlYvyv5YtZRa+mwO5HVYJWKXUtm0pfxVMZa0/AjUfH/tncsw/nQCvjUjCU9jWH9KDeOeuB/L/HAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXt9J63a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXt9J63a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E63821F00A3D;
	Wed, 29 Jul 2026 17:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785345395;
	bh=r6vzkDoeWi5qg+sgoONDH7joLwFrcq+gbKtV+WuJNgg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AXt9J63aUkPSB69c//vjhN2TGcHpHqYziDhsJcokmSEIxNZvPVgf7b2TbUB4n7iS1
	 2ZzAwIBSE7aROtTId6mkK5x9u8uo2Fkigiifp8+zIpNX+b0Q2sWOinADN+dPR+Wr6Y
	 NAjo/fwRqLU4BB7qCoTAZOKe56WIMoDDXC9lAPxxDr4B+VDMWu3b5RtV5AY4bwXlQc
	 99yAJaKe1ysSmEQAKO5vgerLTwJzSl4G8dV2ShZNK0T5PHaZq5mdziMEuRirP8GOnu
	 AkT4mzuKeGFPrUf0ahKp0C45xpdlMfpXV/ciYpFUCdjuAeQ0XOTHiA3axhFQvRPrFN
	 TlZ/CgkXpzaIQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v19 02/10] dt-bindings: net: Document support
 for AN8855 Switch Internal PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260728154846.1828945-3-ansuelsmth@gmail.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:16:34 +0000
Message-Id: <20260729171634.E63821F00A3D@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728154846.1828=
945-1-ansuelsmth@gmail.com?part=3D2

