Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E416735A395;
	Sat, 10 Oct 2026 16:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648700; cv=none; b=I5/6B0p/KJdkHLfLLmUGtrPwyEzJyQBAijY+QsJt29yD+1wMBb67O/K8kE5VFSDn6th3wOQpiuv22r7zEEHT1kPTOYCyhPXRxJ2twIG9mKmWeZq6QQ71oHQP+q172qNStJOzRVeP40mcum5jkWThSPKUVqzp/TUQ9dARw8tezKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648700; c=relaxed/simple;
	bh=CDceZeTjmw+In+sv7WRcHvZP2eIky2Mj6DfmGuATJBc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Z5jT+m7KLmvDQgcht3NANgzlx3QYZkZN5xbiTjIxyGCfkpdzT2oMAnCgMOjmRkHCtiAB5O21+UZHTILTd9LNxo9hdRvQ0MwuqKhVCwNvenIQfDTz73C+tX80Ltykd2gTIynAhrGtt1MnEYgJQjI+0ic0o6rKiEEfsM8P+8dNres=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXg+EJT0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXg+EJT0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418C41F00893;
	Sat, 10 Oct 2026 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791648699;
	bh=CDceZeTjmw+In+sv7WRcHvZP2eIky2Mj6DfmGuATJBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EXg+EJT07z+8bxDYsvfPuGHBRDpwomW8kahFk/YixHKADIfOUEDe30PKuj2AkKskS
	 C/iZ4t/2kLqcxUinS+/bzsWYQC3PCCwzuoDgIxf3n3MYn3KpH5gsq7uPscCSo8V5cF
	 c6kyC2fwGB1LjsMwr0vBuoWJwUkzMoSVOPnnpU9RDZ2ZfX/ceynbk7Z2twlHpoPfv9
	 C/DYK8SyT5QEax097JPjJwVwk90lNtJ+sLp+OMiu8wRYiiI/HqyM2NBNfP0vvvWt8m
	 RWfqgXKGLvo67i9Zn43mFZ5o48nw5FJVIK99LsTZ/HUrI8GsWs72pNYKRjtqiskLKF
	 hnswHB5rFChOw==
Message-ID: <sashiko-outbox-166719@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v25 02/10] dt-bindings: net: Document support
 for AN8855 Switch Internal PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009161102.38961-3-ansuelsmth@gmail.com>
References: <20261009161102.38961-1-ansuelsmth@gmail.com>
 <20261009161102.38961-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 16:11:38 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009161102.3896=
1-1-ansuelsmth@gmail.com?part=3D2

