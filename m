Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E09249EC4A;
	Mon, 14 Sep 2026 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399275; cv=none; b=CNsBAkXTTjAaRoBsCzuTXPCnfXhsSGiqONqA/QiclhoYg7eImp82OuVKdDIN+qcMBkXswz3NdzT7cuRFdnjFWDjwEGL6FUaIWHDDiiwwy3WDEwj2KfdaPk1LyiMDt8OKTRqa2v2lFRJHkbcLFGEGgEnmLocryFmjdTyKGePxckI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399275; c=relaxed/simple;
	bh=x32QQPQzQgrdpRfR+6x5PkkSeUgjL/5Yki3QP22a/60=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SbXLsg4XKcNMaFOOtJEW1Cdw1raOgsMbWbVWJ1cpEpMp2TfaF0SPqNPSDR3+/MvzOKtopKwSEPUT2rMb4Lc7GBsxgQNPSsKui5MtblpF348Rk2YkK62u0Rn4ZIGjk565Qnw6sNAqZqLtk8kf7SnRRrJ9PcEMGLL46janz0WLzSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XF6UPoH5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XF6UPoH5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B7E1F000FF;
	Mon, 14 Sep 2026 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399272;
	bh=h2ZNmba0KibhPNoeE1X88UknsUiczS5w1go9ZpTW9ec=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XF6UPoH5ec2k/tfDv01AHGASSeKgwWL01paFJUMEbIhjvSPlSjRahdO7N6CkcK2J0
	 86lMnNn8p/gGcz+AHEfs2w/tXn4W9WUgu8lCvBSvnTLL0qkD1waTYCpIwcNy8yGGwT
	 0/OI1G0dF+pJ16uuUljKudMRPryi9nUwawLdKO4HQqdTvAAa7UHEIcQSnjGNUykjpm
	 yi1NeKI6bPSwLToXUQQMagebXmCjfxE/lgx5C8xojJE5UAZCXhv1Z/b8yx6MP533cd
	 z/jSX0NG958ciI8g5K18ZdWEBVeLVHiVhrvVUelrOlKzvMdbzEvL/lvQiJ1Gx8UKZM
	 Ngv9N7MUc6tsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 06/10] power: reset: Add psci-reboot-mode driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-6-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-6-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:21:11 +0000
Message-Id: <20260914152112.61B7E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> PSCI supports different types of resets like SYSTEM_RESET, SYSTEM_RESET2
> ARCH WARM reset and SYSTEM_RESET2 vendor-specific resets. Currently
> there is no common driver that handles all supported psci resets at one
> place. Additionally, there is no common mechanism to issue the supported
> psci resets from userspace.
>=20
> Add psci-reboot-mode as an auxiliary device created by the psci-devices
> driver. Define two types of PSCI resets, predefined-resets and
> vendor-specific resets.  Predefined-resets are defined by psci driver
> and vendor-specific resets are defined by SoC vendors, under the
> psci:reboot-mode node of SoC device tree.
>=20
> Register the driver with the reboot-mode framework to interface these
> resets to userspace. When userspace initiates a supported command, pass
> the reset arguments to the PSCI driver to enable command-based reset.
>=20
> This change allows userspace to issue supported PSCI reset commands
> using the standard reboot system calls while enabling SoC vendors to
> define their specific resets for PSCI.
>=20
> Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
> Suggested-by: Lee Jones <lee@kernel.org>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-arm-psci-s=
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D6

