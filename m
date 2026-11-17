Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935749;
	b=zzpmoETP2YpBjz9TchOAdTfSm0P98etPQAM9MB/Wmb1oSg8tIL5OwsfyokgRFdEtmifS
	 pJbBIuO2QcDA0OwnVvygNBT9wq2OZv/xRSIrK/rgmz/OS+bW6uoio+K0gLbhKQ+8g50p3
	 NhBQvCf64TKPY2PtEqTDWXSMOefqKcmPn9JOaZkn/oSLQ0S6a/KOE4XDOu6qNEcYpp0hU
	 p4rDt6m81gVvF4jQX//r4Yd+Eo/wr3arC4tLUl8c1C3PfARn9dMXgQhLax0B6hby8ldL2
	 KSAYxSD3RLTKeKZPLMil0ZFZU1QXCE8Y9wx6oRdn+fBCBcTfOu/9zsjFa1jYmt2uuqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935749;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KYvF4gqk3R8ewaQRHzu6b3iNX315POgSBT3TYO3RBjU=;
	b=Ubn45TQF3gTbRmSY5v7CiPsFDC/z747PxqqCrCT4zDAuTShOZjlCOvqKb2oYkisZWlMj
	 KUmoeq0MyRbeY2Em8jyugtFRU/YDjyMNn4orhafzO31w7nySYrpmBTFe0ER8gCCBLb3to
	 RVmLqFaz6RLSasD6bHa/AhxueeTAwDf8Qfvv7TjZdwEC5Qc85DWEXfIT2KT8iJijkCoq6
	 28LmL+Zt1Jui/XL1Tvpe15XdS38a4dWip2qEFuWQYmjrGl9197xlngIGWuSfhkYxp2K3y
	 smNeum81EylVUQQqoao1W1J1w1AhvEryJCP56asjJDMF0uNfl19gnuXFEXNd8EO0kuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oiv98xPF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E91D606A32A
	for <mfd@lists.linux.dev>; Tue, 17 Nov 2026 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oiv98xPF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE7B1F000C4;
	Tue, 17 Nov 2026 17:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794935749;
	bh=KYvF4gqk3R8ewaQRHzu6b3iNX315POgSBT3TYO3RBjU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oiv98xPF5ZU3+wkC/fm26UnH+R7n6V0cDWJVIrrsNYdoBoU40bP3069td7nXp4Dm8
	 FEMJRAY+hSdnLyfrApD8LeX31fdLzKwOP5aGqejmniox/4OYIfdDcsmoUlJcEc/t2h
	 LjzXqSVeHaOjaYQz07cPKIqCH2IWBsAlKI7c3rh96+7dxsiPk56Yj/UvuIR4mgxmYY
	 SDrsHk9g/xDWPsshmyaVFutvYZO7H5EU1wNfyn7AP0IHNSZiyojZNg93nMcBgmx/E/
	 wPflGQm+lkf91n+oTtr9WWXZKRejGdD2o/MPw9GBoDB1AcRp2fq6rWCNFR+TrpY5hO
	 ftUrGfuqQnK3A==
Message-ID: <sashiko-outbox-219219@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add MSM8996 SAW3 syscon
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261117-dtbs-qcom-v2-2-c0697a0bf016@kernel.org>
References: <20261117-dtbs-qcom-v2-0-c0697a0bf016@kernel.org>
 <20261117-dtbs-qcom-v2-2-c0697a0bf016@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 17:15:48 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> 'syscon' nodes are required to have specific compatibles. Add
> "qcom,msm8996-saw3-cbf" compatible to the MSM8996 SAW3 syscon block.
>=20
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-dtbs-qcom-=
v2-0-c0697a0bf016@kernel.org?part=3D2

