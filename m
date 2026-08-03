Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B937756B;
	Mon,  3 Aug 2026 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752031; cv=none; b=YgJdwUmnjJ7VfVwyzehp8hMvUQrTXADXAYQhw33bo9G+ZNb2Yce69+mAul6wwFPZ3NUdzPptzK6YNvaIe4NLL1IkbWABU/Zvgli9ESLUZDMfsme1tfrK4rKLyvBjq5bBAuJ8pV4OMOkPBrSMGfsXBiThER5/mKM5/zypio0xbBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752031; c=relaxed/simple;
	bh=bWW4Wfpq7alEpgblDKAsy0p4EMLW38RYbRE6jvrzdx4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qBm1zIxTp9AOZC2q6xHHr8OeCOBsHrGBmUYh9isZZ0zOYhesp02PvmH/119mZnc1+C5PmiFOrfvbs8Q8BfxDqLVgr0oFXZXtIvs3XmeuAPVIDFdEMcZGojRw/dHvG9Yl0lDJardlxBiCH9UXDoIaXYBdQxd16vUPWiBlNs/3dxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RbVmOQ3E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RbVmOQ3E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24B381F000E9;
	Mon,  3 Aug 2026 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785752030;
	bh=N40y5j2lfHK9RzlOhBGLRKY+BrqUV7nJJO41+yPtpY0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RbVmOQ3EUOUwXxhvwgjvhplrS3eWpR9J4SFKWViTPU1P7tEujbif8n1Fb/DA20mo+
	 2dSVOvLv1v0QSZPP1bVsKODuaHbk3+YLj+TGmhJlI0EqBLVf/kPSBvgBxCg8d0Ms0h
	 Mc1YnRmhkmpDc0j5+V/TQpMyU//c11jdaWjB12KLskxLrsq3sBejSVAd50UdvsZ5mf
	 DgLLrNPXvngSRV5oPgkGX/2pnlhosWcMGN7CK4tYyarT4SU12xkCFsihlw3M2cWCVp
	 SWc7iqnoF6aTxrlwI6YHkTFJ73OwbP+EiG4Stw4wXwMQo38XXdr/5O1tAoTGhVSzaU
	 R0ZLjSwEZpzuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 09/12] arm64: dts: qcom: Add psci reboot-modes for
 kodiak boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-9-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-9-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:13:49 +0000
Message-Id: <20260803101350.24B381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add PSCI SYSTEM_RESET2 reboot-modes for qcm6490-idp and qcs6490-rb3gen2
> for use by the psci-reboot-mode driver.
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
>=20
> Support for these modes is firmware dependent and not available across
> all kodiak based boards.
>=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D9

