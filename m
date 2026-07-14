Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853952F3614;
	Tue, 14 Jul 2026 17:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050272; cv=none; b=HSSvXaOiYqbtI1JbUdR0ceuXlV1cqGINkJD3ikU5H+R21XmFu1+zwt7fPS6ilhgxJs6upam/64AKmX9B5CNJSRyPbCjIzSDMhyCY3kiRLCWqGsKRdMzc28yBBWBn5CJk+5gZiS1nXymP5TxqInNv8Ky8FLwT/vFlDgjl6RE/rTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050272; c=relaxed/simple;
	bh=KFBql864CH6U7gCVfquaN6ZXflddMRJSomdfQ6HaPQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hVHlXHfA74Z0/BerDJRW9i/cXdZ+QkFsqod4SN9+yxRM5k7EWAX96sK5eOZPMpw+9+93a4PszYc0l6lDu06LEqFoBKMeM+oxN+CDXCQMGbPQnEAQwLyO+EaOy5uEQbcjf1T3gX569yFy+6tffSS23ZZBztx+h8a0F9gRJgCuUL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzg1mQj+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzg1mQj+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A7C1F000E9;
	Tue, 14 Jul 2026 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050270;
	bh=KA6bTba6wf4zsGMDKiAoAkSyb8oyQFTaJx14DUITZDg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gzg1mQj+rOaU6+2B89QBeSDJqqbSiv+Se5fvZ2E59YmtY9n32h8z91ggUoZQL21Wz
	 2hZkutUlYiWU3dokrhhkR8GVTvH59GBPLoFfuGEYSspxujbNERSYqcSSoanLIWFEcC
	 nQLmDgliNz2/a4wg524KKYbbX6WrfAyiOoJ8Zl9CleJDX2qTRuz12A4F4eKtK/1nBv
	 AIuROdqleilY7b9zlNKiDp2n1EhcFov+tH77unlMJUJtOEHXls6rIj+PB4EtbXBqfl
	 E0sHp6VsF4Vo8kk3SY1XmUVGeL3u/yFiyTpoe2hkjuHkL7SuwKi3PMQym2p+45Mqm+
	 ewDXQc6jK6F/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v23 12/13] arm64: dts: qcom: Add psci reboot-modes for
 monaco boards
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714-arm-psci-system_reset2-vendor-reboots-v23-12-e7453c548c21@oss.qualcomm.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-12-e7453c548c21@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 17:31:09 +0000
Message-Id: <20260714173109.B4A7C1F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-arm-psci-s=
ystem_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com?part=3D12

