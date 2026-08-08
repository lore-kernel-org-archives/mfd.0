Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B7A15A86D;
	Sat,  8 Aug 2026 04:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786164727; cv=none; b=HGZUTy6xYfrFgJVF+LKpXTN583fMk750Ykh0RYzhy0k188mXsH7jHR95DFCih5dXMAEQ8GxJfKsTkHPsZRVBoRw0EBqzm3m7WWiTQG5ptajS6AQX3DIuWey5GOYTV/1brfCk2eF8mhaNm6EP6gQ59c8nHw/XbFLL4lKVIWMh0zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786164727; c=relaxed/simple;
	bh=g7/UbemXKPLkiZ5ilFc+Mwst51NkZDz7cW1GBJgjs+M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NpIplqpGLzUxSqiag5Cyz99dzPREK7FhwybxpsMO1bmQ6VCTCyvDIFCBBvJ85vAXSxmmGDP62FBMvUIiPj2ruMUQlYzUm22C2ndWc+lsLnKul1IAfLFcAvbKKGQ4BLT1EWeWeYzyh/qVnz2G9bH/PS8K++NNgPXISJtvxATF5lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlsxbRVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlsxbRVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7EC1F000E9;
	Sat,  8 Aug 2026 04:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786164726;
	bh=g7/UbemXKPLkiZ5ilFc+Mwst51NkZDz7cW1GBJgjs+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XlsxbRVcAFX7RRAN9+P3pRHZvU/C6N4BeSKuGrJlML0FX2sK43znWeLTLUV3hIgKG
	 ybJqpNmgWr85mRDDpfKGr7vV7ggZdnWq17U06LWyNqnr996EwKppFFmW+TxuG6hS60
	 2ynZt7zDks67+aOISdjCTWcUoDbBvbVN3YEhvjRPw+maXcKkt79CPL8uSGevGQnNch
	 fwqhsLnQj6giGbtFsU2M0TQ/PFsgYassOhHL5+r8f4RaF0XP2DZMY5rUHAUd7IipVn
	 iOJoe6Ezm0BnKz/ycVzeJrh17syhU4J16OdiDE71AbyppuyZxvAwxtEyGeLxS2tuOV
	 sgE29diEuiu+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 3/4] dt-bindings: net: x-powers: add
 AC200/AC300 EPHY packages
Reply-To: sashiko-reviews@lists.linux.dev
To: "James Hilliard" <james.hilliard1@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260806-submit-acx00-of-dynamic-v1-v4-3-9bf2f7441632@gmail.com>
References: <20260806-submit-acx00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com>
 <20260806-submit-acx00-of-dynamic-v1-v4-3-9bf2f7441632@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:52:05 +0000
Message-Id: <20260808045206.3B7EC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The AC200 and AC300 contain compatible Fast Ethernet link PHYs which
> report the same Clause 22 identifier and use the same link-side register
> layout. Their package control paths differ: AC200 uses registers in its
> I2C MFD, while the AC300 control range is at a second Clause 22 address
> fixed at 16 plus the link address.
>=20
> Describe both variants as Ethernet PHY packages. The package reg value is
> the link PHY base address and the child supplies the documented PHY ID,
> because the identification registers cannot be read until package setup
> has completed. The AC300 driver reaches its control range with the PHY
> package offset helpers. The AC200 package instead references its MFD.
>=20
> Give fixed hardware variant-specific compatibles. Also provide an ACx00
> compatible for systems which can contain either package, with one packed
> NVMEM field containing calibration in bits 3 through 0, the AC300 selector
> in bit 8 and its low-calibration selector in bit 9. Such a description
> contains the potential resources for both backends; the driver consumes
> only those selected by the configuration field.
>=20
> Describe the package clock, supply and optional xMII receive-clock
> inversion needed by some integrations. A fixed AC200 package may omit the
> NVMEM field and use its internal calibration copy. Limit AC300-capable li=
nk
> addresses to 0 through 7 so the control address remains in the documented
> range 16 through 23.
>=20
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-submit-acx=
00-of-dynamic-v1-v4-0-9bf2f7441632@gmail.com?part=3D3

