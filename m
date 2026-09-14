Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E4B47A88C;
	Mon, 14 Sep 2026 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399718; cv=none; b=RT5AJ+PL6DsdNT8qVgtynedGfsK0BbbWHfyDfo7A45sLcUQyQbAC6Bbm+PkIAxVps12K/CLNZC1RywVp2prWPTEndWhdaIb/Ngfbkao8u40ms7e+TpMKm5YFJGoXtTDvx1qM1T7QpFMD5PU5nIxxwfg8bLV7QatcACBkUyNIN/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399718; c=relaxed/simple;
	bh=AEL38DS3ZK+J6p4PbOPIR3VRCFNDEZznPpod6RKHJtw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=befZa4Q6t7oA4Sefwivp4cZZ+M92YpxGKwLZc6PBNy7UcLJuRVaNNLNzaWGQ1M5j890DvTLhEY0tPJzHTCBoYWWJGGWM+gSpvYaxx1CTbNL9OZtKSC2dHextdnttOyNbrMLNSLohcd4cHM1SQCeatwiWtBjEN5vtWMV0zMRKzG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ntPLqKHN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ntPLqKHN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97A01F00893;
	Mon, 14 Sep 2026 15:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399716;
	bh=na0p7OTpWXMw5MO73chmPnSNO64+Xx3tx5DBuXSpJWM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ntPLqKHN/4Pq/AhcUs4hKDqFCOH3EFHStWHQ/SohgSzAu01ACIJh1a0gEFIMPkLvQ
	 444v8ukI2gtKHo2d9d/OVd+En4kWdQm5x9RuP3GMPqap0KCEjuDBSxRrI8bWCA8RvA
	 D5TiWXGXQ8UCzFcvDkemtT/pa3qFoTT0RFvpSfZAPXBnATrB9swKqqc1/8kUkJ32C9
	 lXSdn8tJr3Tdz7ygr9f5rEYNDBhGy0mKm4dcPFVw9ihTSshJVdtFG3/Q5IutQMvwOH
	 OEvnbMgRg6aMj8bIWkwG1fQQeNxVvpLa9KNV0ClwSa8TyNQBvJD6luY/3Gf5DpV82W
	 L7GEffih5eFtg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 08/10] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-8-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-8-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:28:35 +0000
Message-Id: <20260914152835.E97A01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add PSCI SYSTEM_RESET2 reboot-modes for lemans-evk and
> lemans-ride-common(sa8775p-ride, sa8775p-ride-r3, qcs9100-ride,
> qcs9100-ride-r3) for use by the psci-reboot-mode driver.
>=20
> The following modes are defined:
> - bootloader: reboot into fastboot mode for fastboot flashing.
> - edl: reboot into emergency download mode for image loading via
>   the Firehose protocol.
>=20
> Support for these modes is firmware dependent.
>=20
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-arm-psci-s=
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D8

