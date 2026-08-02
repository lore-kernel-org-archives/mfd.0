Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1657E273D77;
	Sun,  2 Aug 2026 19:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697853; cv=none; b=s7EHJrjzajMHIUtiWv//001IDjoFLxiGlMJ/SGYdDoqlljW03ghVDV4Bf7rsFtC5/KnZrpq4c5T0zFxIsTwZM1wT3iYs2nJQjlibktmWoTDnDD7hTNIY9mK31Vsjodpk863SGm55X8fjEo16aZGj0jkQXZqd0FdSrBxgkxuq0ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697853; c=relaxed/simple;
	bh=+DulwsR/shT2O3g6tFB//BGBBQg7W8w/nF6YeAdwT/Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jry727rSEfIc0PKWPoY4mDXyLB1UJL1FqtC5lSTjKJ65qmJxy6Q/TyTF4xJmjZZQNAZStNU76kzS0RvO7E4dHuC1/XDX2JbcvrLfuHyYGEBPSsDZrTFf0IGkaz78nIAFBY/ssUEMAAlRjmZq65iN6ejhd4rfJNyEFj6HkN+gf6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EXcjnUMX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EXcjnUMX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4F11F000E9;
	Sun,  2 Aug 2026 19:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785697851;
	bh=+DulwsR/shT2O3g6tFB//BGBBQg7W8w/nF6YeAdwT/Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EXcjnUMXL3745BzyfT0SwdGegI2UwflDTaRX12dueZCwW3bx/YxmngpwAp7zpOYpS
	 bzilyMVGEWGCEr0PM3jfiddcmSIVj3Bm+P2HPbEO31njAWebf6lGveWz1ivy7TNUAW
	 KWOlyz8w2bWKJbaLFAZqfNOMsk89q38hp8UHsnePwDYqQ1wzjuqUYlWR1At26b+pS9
	 31gbb7xNbRrp/ZaHNHBuPCNG+TDytCKdcmqoREskzIHD2I7GzVJXiwrH1KLynNvhpW
	 rHgR6PUZn9/OHJh9gBplRzo9ED8WNE9tF7MZjyfD4HQUB34/iM5gsa2be+cmtz3ABO
	 jcvAnQykq1L8g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi
 and Bluetooth
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi" <linux@smankusors.com>
Cc: conor+dt@kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-msm8960-wifi-v4-7-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
 <20260803-msm8960-wifi-v4-7-5ffa27aea39d@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 19:10:50 +0000
Message-Id: <20260802191051.5A4F11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>=20
> Add Wi-Fi and Bluetooth support for Sony Xperia SP.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-msm8960-wi=
fi-v4-0-5ffa27aea39d@smankusors.com?part=3D7

