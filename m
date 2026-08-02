Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82FF23183C;
	Sun,  2 Aug 2026 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697718; cv=none; b=aAxGTJbioXAUJi5Fwcbc9uW0etwvyYoRTuAshx2x4heudSJ/Gxao4TDOJc9eZ2Z8AYoBxJvmhk7HRodSLcj2T6mgWXD8JpD6uZPSkE/yurO+W6TcZ/WvoolEFgXq7LKzTRuRDRBn2TWS8HAyGgs8iMBpkw6kumjjBEdWMjTL1mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697718; c=relaxed/simple;
	bh=FQfgcpRHZwuu3aQFU25YJvknvijmryGqgSR8EFZUToE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rGY8stkQvijdkiM4QFKTUpAT0maHibgkx/ha8h5hM+TzwRJ5XHglZkTSTNhWbV/UluWY99NmgXXogramFoUWl1N4BLZRbmZrstoTndN4W6cINIqrwuYcu0dZuHz/Nkp80Jb/5VCkslaac+kmrUjswfuhdYPzFEk1wbe8OggNHBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcaOZ3Kd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcaOZ3Kd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E551F000E9;
	Sun,  2 Aug 2026 19:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785697717;
	bh=FQfgcpRHZwuu3aQFU25YJvknvijmryGqgSR8EFZUToE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EcaOZ3Kd1ArzmUJuR/AazsCXXpWSiRq6jx9n8trCzRjDLUGTfoI8rKEqHLaRhMV6Y
	 5QR0doWDu7mAJdu1ytx9T1ieW8/DScOFj6qS6ysyb/jcFhPrlvP2TVViMBOkZlElwX
	 jA/+gU3AwPZitVHcUhr61C0GlUS/7iiJ3juYToOXzvt5/oe9B2gyHnAo7Iss6BtMPd
	 1RRXJaeRd2a+koSefgD0RiZzqP2VjmFXWTMcqWp60HNBJ26mQLMiXilSjrjFBFjJqv
	 OcmVS9EH949G+nh1BUVYRxRUW6Y1g2RkarLgLVFE9Cmn9HNfomDQDoRTwhYfkC0/v3
	 nuG/aTziISHUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/7] ARM: dts: qcom: msm8960: add SMEM & hwlock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi" <linux@smankusors.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260803-msm8960-wifi-v4-4-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
 <20260803-msm8960-wifi-v4-4-5ffa27aea39d@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 02 Aug 2026 19:08:36 +0000
Message-Id: <20260802190837.19E551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Antony Kurniawan Soemardi <linux@smankusors.com>
>=20
> Enable shared memory communication and add the SFPB lock for MSM8960.
> These provide the foundation for inter-processor communication with the
> Riva (BT + Wi-Fi) subsystem.
>=20
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-msm8960-wi=
fi-v4-0-5ffa27aea39d@smankusors.com?part=3D4

