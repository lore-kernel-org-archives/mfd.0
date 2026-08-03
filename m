Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC23644D4;
	Mon,  3 Aug 2026 09:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785750977; cv=none; b=PwaD1+KhPcHvTbBQSEHJ/5jnvjZEQJvHs6qMZSdG7gNcdO/s0BHTUPNj8cameMQvwDKc/KZiVyaXqCgmXWUn0OIoOhMBMJwVJi/gfhJigDNrFPWpzUJTa7FECF39Xcrt5voHCUl8/YSmOYLJ1siwCGvdrxQIiK5URzhusSJSzl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785750977; c=relaxed/simple;
	bh=HIYeYqIQn5RqWg4QhGBpjf6tVoJZLkVrEVvzqMkkIKM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tNAWVcl5TGIFJ0W2L0FNJnPfGvHczooE0Rz8b93MMrey6GNeK3vd4TRyrlCKKGdoeIP3jqZbT30wjzh48qHQ2ukTvctPPhrTTFhyTDoW8EywB8djNjTNYzCdVXZR8ObR/B7NkrQxupJbNBWySl8GgoXwk2ifJM5Uoqd4l8+U6FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O2KIubX4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O2KIubX4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FC11F00A3A;
	Mon,  3 Aug 2026 09:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785750975;
	bh=HIYeYqIQn5RqWg4QhGBpjf6tVoJZLkVrEVvzqMkkIKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O2KIubX4bvXfDklx1wvv9KqzcJJj3U2UPYxoHusQ2CjzBaDvT5H/iVW+BOPR/hDjt
	 YoNTCL57ddIV1hPUeCPQmy+DQur/uOaJVoUjAGJQbLuez+l4wxhVKKPrRsGL9AUJaB
	 N6PZtVvH/wmKOdH7HZo/JulCzvoVdxrWbCXjkDebAhk340QNWD0VUpUfI87Mse8Sbv
	 7kuzmy9tXOnwzcUp0rEcHhQABvYFIrHA/gPkok85H6sXOQv1gVhEy4riwCgTxEmcQN
	 Yo1S8qb/blA53ZyELFGMqOCePM5lDPX4biw/ROjQGMK7tWkQWaiqCUMBTfAXUNUxtA
	 HjrZzmsWZ14FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 01/12] power: reset: reboot-mode: Support up to 3
 magic values per mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-1-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-1-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 09:56:13 +0000
Message-Id: <20260803095614.F0FC11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> cookie as arguments. This cannot be implemented via the reboot-mode
> framework, which supports a single 32-bit argument as magic value.
>=20
> Extend the reboot-mode framework to support up to three 32-bit arguments
> as magic, per reboot-mode.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D1

