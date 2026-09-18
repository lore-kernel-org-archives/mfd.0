Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D12511E69;
	Fri, 18 Sep 2026 16:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750185; cv=none; b=lEgrHrn9g8slWCpHW3FRhgI7qcu6DRq6T8FbsglzqYChpCNLXaS4OfwfozUA5K1ZCE3dDeVjoi+A3Hm5XLHh5Fvl0xbHTDUjf7cflEO5xyL6jGMf2NvuwnS0xVRs/+0tgxr52Ulvq9TeCbBbdnOe8j3R/DkiyJG9GqgLABAmBTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750185; c=relaxed/simple;
	bh=AV42JekrvQYYAJ1EJzZUcX7wQMCIKa7AbgrLt8Ol6hQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dKqfyQOnEuzkNudKpN5Tkq2QbcvKLE4VKUHfyi6H/XbvaqbexNBmuu3ZDmY1derPku8QGCzCnrzbqoLgD+A91HCppT/tmsmpW9fb2Ix2CcLp9FjfDuSIoTW2jzydTZQWSsm1BqSYND4QU+2tVyNnx/Q1XW+2NTy7/uytKtQzcNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUUWNrzv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUUWNrzv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76BB81F00898;
	Fri, 18 Sep 2026 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750183;
	bh=AV42JekrvQYYAJ1EJzZUcX7wQMCIKa7AbgrLt8Ol6hQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUUWNrzvCaSeaA7xN/XYXZO54Gi/p1LSR7f7hNO+OPUREKXHMqgKJew1Eb50bXy7c
	 xHKDPlmORQ/1mAB2wuNKnEY9gUtcytaWedHrNE28RTBB78Hu9dJltqU7RoKd+nCKqQ
	 jsQYsf6FqbmGmkm/dHksnQSDfOfdppobH4xXtu99g9h4nPR0roPQlT4BiZLXxCCCc3
	 OQ03T6UUrT92tXOwrwpbDsKHfzrawmAKuk436KWhphIuuuFaRa0x9J14awzO9nXegp
	 9B1SZvQTc5u3OWTvxbZyDXxZzopoQhOalb5n+7KoP/lW1nEglsnjhr1xSioIESk7Hh
	 LKZySHHLI7qLg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260918-pm8010_i2c_support-v1-1-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-1-de33d78fad9d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 16:49:43 +0000
Message-Id: <20260918164943.76BB81F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> The PM8010 can communicate over both SPMI and I2C, based on whether
> GPIO1 is pulled high or low respectively. Since the qcom,pm8010
> compatible is already taken in the SPMI PMIC bindings and that set of
> properties is heavily tailored towards SPMI, introduce a secondary
> compatible to handle the I2C case.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-pm8010_i2c=
_support-v1-0-de33d78fad9d@oss.qualcomm.com?part=3D1

