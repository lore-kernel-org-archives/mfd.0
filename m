Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08BF332907;
	Mon,  3 Aug 2026 10:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785752119; cv=none; b=PYkiHO+ApCA16um772EBgkni1Oai1h9URcGjdd+egTu0IJqSrLnDjiNtsdhWezng11IuCyJGd0uXA2EEMBkzgeKqlVpAuAPLezRaC2cUeQTUW4bicR8slqUMj5vBfOr3czvHALfMSFXeXiEHYDmyX+CjFVNPtGxkxZqvGKIzkyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785752119; c=relaxed/simple;
	bh=EltyCprHenJnnx9LvRtFW0itwqTUd7NJeWYqyeEghqg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JL0kl+MWjPX6TDiU7a5Hl4uGfgmjo+NWko4iu+DryHRXYFrU6raITLurmj5iLOdhZquO5KnVkubDXtLY3ox2Bz+KW0jWaBLMeCY0N3Hy9PATOfnrLTybAABPN09GH0rT/CulsUvT2SVGRrY8Fu295kFTjSRef/AT+Y7Xtht1xQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=frziJP1h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="frziJP1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DCE11F00A3D;
	Mon,  3 Aug 2026 10:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785752118;
	bh=yCKER/W1IAIaUnAixkZTgQTzIm4Jhow+HngRtNHqh1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=frziJP1hmgIhbCVzI1gnpc83Miv3pno/A9aWOvZqcSVIazDy/21SytwUTspbzt2HH
	 VNuzehvDqtQRJkzCYHIK+4B6pWX/X7kUalHg4xHNIpMSIqnFa0QFnLKyE2GjW5gGFM
	 WMk/jZwba+9ESGhTWWO235M4mOqJ8Sd7LF9UNXt3ZRfbHz6MibYagjsCSGDyrRM8SW
	 z378D6HsS56lPF94eFy3JAg33bLypbfKTbK/MXD41EfOUtxhPlH8dnPcgqqYJfsNex
	 Q3Zwv8tXcKZaEJJdBGR/X9jHzpHT+2TYwnIRhrvYy1SWefYycsV2B1z2Q1IaDby5zH
	 TY5MwqwvF0oQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 10/12] arm64: dts: qcom: Add psci reboot-modes for
 lemans boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-10-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-10-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:15:17 +0000
Message-Id: <20260803101518.0DCE11F00A3D@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D10

