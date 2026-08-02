Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F2F17A2FB;
	Sun,  2 Aug 2026 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785698530; cv=none; b=ZNJaRTfSoIx/Jf8q5yIH1eL2eVR0yxCcXl8FA8MaUmGr6J5R1ciZIJw61KblekDYFGvr+73/TVrDu5AsJb3tW/Rzpe4ldcu1zSVuQKTJTHkGywO6WLMx+32+kTIyqDFlke/MhANEFFjGvj3cbsDhWofUgDo+F1+NZl7GkmXd/UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785698530; c=relaxed/simple;
	bh=r3ddx/PdSW8Zto87cH23r+MehSGZ4i+Z5y/qiSzRAYg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sh8uExviyxf+gO9cN6Euhzr96osqiqMxcJn2wPef8SGq91PLXfla/NnCGgReBKyMlYi3D1CSEHOtR3a3A76qOKDQnLI2C4/qWqa1zCBnpnFsbt1uJXDP60nv6JDRtOTCMGqBOftiJQl7vTENmVQdRsZaYGC8WWy4ulkZYlDvgs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZG9hZLI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZG9hZLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DEEE1F000E9;
	Sun,  2 Aug 2026 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785698529;
	bh=r3ddx/PdSW8Zto87cH23r+MehSGZ4i+Z5y/qiSzRAYg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bZG9hZLIIGebh8PrHfUE4TcB0CCqNP0ZLQjhxtf6bwqg9mfaiaQvvGyMAf24RPzRG
	 jSkS8uCSIANqZW1aA1L3jSZIGp+3ojClyUYOzX02tQOpMYJEAOWYBVOdBiTImmbfaQ
	 8KFEJWoDAUa3am4pAne8DH9lh/qgX9c9F89SgrdgQLky7yLqLTEGfa/B5YNwGksSr+
	 0TCX0E47XjiTjpt5fYx5bX+vZ7OU00Ctp5HLuNEng/tk7V5RLf49kJvl93lLAlFIRv
	 sggtUaWn8jIBVvgXIo0nznnlzU6NgUh2Yiq7nUT4kHQkDChsoVOBdXRKaiE65PrjCQ
	 sRvA9KgOtt/Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] ARM: dts: qcom: msm8960: add SCM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi" <linux@smankusors.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260803-msm8960-wifi-v4-3-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
 <20260803-msm8960-wifi-v4-3-5ffa27aea39d@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 19:22:08 +0000
Message-Id: <20260802192209.2DEEE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>=20
> Add the Secure Channel Manager firmware device node to the MSM8960
> device tree. The SCM is required for secure communication between the
> application processor and other subsystems.
>=20
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-msm8960-wi=
fi-v4-0-5ffa27aea39d@smankusors.com?part=3D3

