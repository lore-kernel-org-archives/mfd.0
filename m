Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B98F485934;
	Mon, 14 Sep 2026 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399555; cv=none; b=aqXjrJT4uzrijNQIBsLfaOsIuwEc5XJhGgCQ2IhBJqFAELnQMhecLoSGE4bAGx1zTXFz/5IGpJcqTYtg42njZz3GajNzowI/ceBOp8wFdsEIFv49EkqiQLrCD8JyNidHuduQ5VksIn9sZ0SMGKrjKNBIG8Yj4GLgms05gbGiilQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399555; c=relaxed/simple;
	bh=0Yst5hNpqPJhhGlVQKN3d417vMAAd89d5eo8IwlIHoI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rl7H2JZXY4C8SHsXwXPzpz1vZTGzK+vzTjxijmhxiYAl36f69PcWLhbfBlDGlHDcHWtxkvBkcuJtK+ZFOvMrrNRbHhZJlTXVMagOSZVd/GmExEoQvMlFTxiz7Vucl6xO3YOG1EEFFFny7G0AK+Vve98rK9Ue7ODNAuzh44AU/CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ml+GEBF2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ml+GEBF2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C43F1F000FF;
	Mon, 14 Sep 2026 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399553;
	bh=E7YRuzFRmGKUBkdt5CuzsJBPGUN5QbH17JXjd9RvpKc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ml+GEBF2Oa8mv+xmgp8a9CFgtx9VMril44mUIe1KE9YA5Z5ekXg3abLqqZpqvDb4S
	 wGY6JvhHeSng6kpSeSP7NquDBIj5btVfAKPPHZwkmYzQoB2AE535lpTXIKvpajJPoa
	 CxcgZhhqsuaqEH67UoZT9SwK/zjgHmj3qpgpYqV6/5/BQHBkzgKKzuqY9+a9yJGity
	 gJGE20iKIe6rIt2ZfbTm9BQ3dIdQCGmsdY10GBkYB8TkDkgdh3TRFEGJNo4MdIqkvf
	 WeTooL4MhDL3mJ6XCQEDPQ+DeJ/FuYeVi3Ia9aJxLKujlUoymFc4Pc8MUSeF4FALjQ
	 2DV5LtO/zCWBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 09/10] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-9-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-9-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:25:52 +0000
Message-Id: <20260914152552.9C43F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add PSCI SYSTEM_RESET2 reboot-modes for monaco-evk and
> qcs8300-ride for use by the psci-reboot-mode driver.
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
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D9

