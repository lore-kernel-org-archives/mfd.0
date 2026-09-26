Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2981A37475D;
	Sat, 26 Sep 2026 18:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790447119; cv=none; b=beT/yDRl11roWli2WCQsnjypLFwAZYwjtRqAp7gzVl0udbjPiFP4t0xoX2E6AYXueeWQKs7u+3g3eTulRUq3RQUE7356qGmkC51FL1RU9BNrButz3h6leDtyz2goW2Q/mvp37bdBLUj3QlKy3sCkNKkWyERK0WGHkNJfHopKkqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790447119; c=relaxed/simple;
	bh=3dZUgk8DJ+JajF+306pOrTFYeV/cpfkNThfQ0kYFGxo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JD8psixfEKl+KGe0PkWdXGArQVo7wBGXL3klrsjE5CimLGP3jTNGYlbIqnN+tS07d56deRYl/Zq8UgmFlViIQ7STsOUUb9ezPNItn/jTqidZ8hHsgHvlbwRh8XyvptsCKDq80OwNIQgHrVIgNLfAmamBEJnW+jAcW37VsxQsNqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKPGxcZV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKPGxcZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52DEC1F000FF;
	Sat, 26 Sep 2026 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790447117;
	bh=3dZUgk8DJ+JajF+306pOrTFYeV/cpfkNThfQ0kYFGxo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XKPGxcZVwq5cTCeoHmS0ZsBOlR3TjJjaLDvCDtxMKuiMVOK+wGlacp6N3ia8W31Jb
	 n0TEPtL8Z8HwMJvuCDthSfClkNbWpRqhc5uozjyc7lR7JfDR425yXVr7IL6bxmsdx7
	 SsBBBMhWCRvFf91w4iygXBi5U2X7eL7CmvH1sQs+UUrsMRsA3uqpQm1bwb084vz05w
	 rFOupZsRrdXqkJw7eIr+LcvbGFqxgdQaZV23sPy1fDns5voyUfqw2TfuPOc/hD9zwN
	 +tn/Uc4f6jr5mAqP17om+ediAsjEtxlDHdTRc95en1SfZ5uKzswV3XLwI+Pr6ns3KC
	 Og2PoOKEjz7Qg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v23 3/9] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260925182435.21207-4-ansuelsmth@gmail.com>
References: <20260925182435.21207-1-ansuelsmth@gmail.com>
 <20260925182435.21207-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 18:25:16 +0000
Message-Id: <20260926182517.52DEC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for Airoha AN8855 Switch SoC. This SoC expose various
> peripherals like an Ethernet Switch, a NVMEM provider and Ethernet PHYs.
>=20
> It does also support i2c and timers but those are not currently
> supported/used.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925182435.2120=
7-1-ansuelsmth@gmail.com?part=3D3

