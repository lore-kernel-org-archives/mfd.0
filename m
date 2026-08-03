Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D69632E121;
	Mon,  3 Aug 2026 10:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752083; cv=none; b=dzPSquz1rXOJwCNQMgWkzenPrgRJF7dAEbs5Dq6H9mq12340UxQqu529xJhVBoQTmpF/xzaWc+R8O5NSRitMTvPjcSy+AU02XVzWEUkDuNqcGOrGWqpMCkxA/PVggfuSTvcd4LJArCoReiySLls1pFbBd7o4hHsjplx0KeJ0PCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752083; c=relaxed/simple;
	bh=CYlSIlHK5kiTJtzVkocFRD7xLHXRQ6lYk/EoioXGuCs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YR7rh8+Q7Wn8Qcx1RS+YimaijQhCx+q5Kun3BUztADfSDYK7HcPSn65ZW27oWm+s0VeR8QlLw/pguSR0aHWGq5mxz+U1w81fy0llmX4ZrT4x4mOF26UAK8gcCJYa6UrrMZg/eBHePojJyg4lj2B7uaSk1kYazyRBfZ4eKBIGjP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lOdcDPBI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lOdcDPBI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56FBC1F000E9;
	Mon,  3 Aug 2026 10:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785752081;
	bh=HaRXEDAYCrZqRVNsf+kOVE6r9tPy1X5NUAvonJlYUyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lOdcDPBISmRiHq56OH3g5HosK3T7//F3kgY0nWmDYxuQMSEqCdW2ssYjYW4y3rZ/H
	 hzhJmLkQUepDvU7XtUaqkr7CFXVU7MOuinLSl+QwQGaT6Qqj3njfI87altNCCjSRxc
	 S0fXP76bGZK1yE8+FlSB0ApLDgj5dOal1ybUhcr78B6ayh1VnFvrIFAUL91mjvrO1u
	 fRYlCv7wZCBfBW2Jx/2Ok7XZXvXn1h0dYI1wT3n43Vo9S78PuhyZ+p5FnkskkanESX
	 tOprp+fas+pmIJ7bhogq77QNrOPCnPtLEVxGZYQQb403ymw3Dhpy0Ab2knRA/xuEwf
	 OhGm0idwIjT0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 12/12] arm64: dts: qcom: Add psci reboot-modes for
 talos boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-12-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-12-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:14:40 +0000
Message-Id: <20260803101441.56FBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add PSCI SYSTEM_RESET2 reboot-modes for qcs615-ride, for use by the
> psci-reboot-mode driver.
>=20
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via the
>   Firehose protocol.
>=20
>   Support for these modes is firmware dependent.
>=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Song Xue <quic_songxue@quicinc.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D12

