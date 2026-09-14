Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C286E3D8122;
	Mon, 14 Sep 2026 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399182; cv=none; b=ER7RsFQ5GsRRrYCaLTrOXIeeZlObQ8A3YJc9j2VvlWXmzBIglaOj7XocEbv4U6AyOtPtOJ4qK89tq0HkMIFIGmjbB+Te+0T2sq9SCNNpCUI+JiU7qqGHB0M8YCEJisNo7mie3TsFKEyMg0xPliUzBklWNHr2JVRX3MyjI9h6JqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399182; c=relaxed/simple;
	bh=sjhCB+dY6qPIvggIFSx4UM+BYRA3IrlBIcNc9H7U71s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qiZtB1JDdHQFUldLTxPQsic0Yl3w5RuN91OuaSsoRsjwr8sneUlcs6CAg038QlbOt05jW7ddSTk/3jlIHq9n+1mgwAvm/x/gQpUJdjyPps76Tgn8RwCNoUNjbGqjIONLl4sQTg1X54gTb2Bl3gMNYygtAB+W7MOhBV051o3c0tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dIJtkTtO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dIJtkTtO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BCAA1F00893;
	Mon, 14 Sep 2026 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789399181;
	bh=sjhCB+dY6qPIvggIFSx4UM+BYRA3IrlBIcNc9H7U71s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dIJtkTtOZDxi6lPC7x1pv2KGluUJtw+gU1VALEjjFCAVU4YfKMH8nUUc6RObJQkam
	 X5oS22f7qDlcRni5HixUOLeyH7V5qEtH5zKspGIpG5MsCDNEhqcRXT4/MBPS1fcYiY
	 EqaZQB0VE7SMXAMaCqZR982fRqkpqiBNt4LP/lPaIiqJ4YWlLQegHPJbYRi7DLWzgr
	 QYDYMX0UwULeWm0xHfxLDq0ApIRY1U7UBgB2m36uI/Citj4C0rYqpdJggEit4Z3zs1
	 D9wvI/S12nYB/Yr0GDoK2ZZ1ELBsm9l4iohlpOje7oXEPHZm72qMaAYAXRRDtF2dCB
	 ZfyJerHuwo7Cg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 15:19:40 +0000
Message-Id: <20260914151941.0BCAA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add bindings to describe vendor-specific reboot modes. Values here
> correspond to valid parameters to vendor-specific reset types in PSCI
> SYSTEM_RESET2 call.
>=20
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-arm-psci-s=
ystem_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com?part=3D5

