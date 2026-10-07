Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5546984D
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365791; cv=none; b=qMqeodV0HcUUiGfAz+f9Yja3WbfXLvpwv/ncUlPkKiacnW7Rs4RJiAaaY9ECjH0GMzw/vW/vJ+z/Ujm6yj+Zkf9sF3lSe8KktxkVNjCBSG2ZDsNbsGwLxjSVIjEXW1gEupmH41+nLYSe5rfcznUcsgRY/iwyosmRnTjcmAzbYto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365791; c=relaxed/simple;
	bh=dpeCnOnq6BWyjTiNBa8f17hEMHwyj8RuYabysCkeGWo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LJpC0AVjCZrEmGvbTWt6zynrBZC48q6BY0gfS/oDm+qoc/MT8EV4EFSdu//OKAEu3X/FsSPjNJisAmEfreFPH2Dq6yHSpzF3NBczYy1QqvQE+R2frARN6PJSFzDENEReQ3TxEi3GWQQq+wG0/f7JZCJd81SCd5UI/2eVpUyxpBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NEgSwNqM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NEgSwNqM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB9141F0089B;
	Wed,  7 Oct 2026 09:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365779;
	bh=dpeCnOnq6BWyjTiNBa8f17hEMHwyj8RuYabysCkeGWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NEgSwNqMJAsOvAMBr2eCozdko941l0JCWiI9JfZVWQGeafuFMdJ8rnp67vRmxqJe0
	 seo/vH7S2oBtCD13O/Z+O/iWXDpS4s67oqvYOL1VKLdoHdLrgSNSLVEmyuOw+fAnUB
	 3wdO3CSvQslkG1kNjt2eehmWoR9RZROXJD+OTyhW6nKn2viW2V6BOkEZvBu5XkBLnE
	 r4YxlmFwX7Et4WoiY7D8CCoOZDQMNsAo3ACNQm7SFuc7FmUXNsbXw52hRk4k3c6zAj
	 VGhZKq/PLwFoQVSKmFd9gwO++6fIRxGEaV2CIUUcsCqXTyqJ46JPfIkOEHCP9/NsX0
	 13fhsgCPihvzA==
Message-ID: <sashiko-outbox-162803@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 10/13] mfd: nct6694: Extract core device management
 into a separate module
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261007092102.3768818-11-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-11-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:36:19 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Move the IRQ domain and IDA handling, which do not depend on the
> transport, from the USB driver into a new nct6694-core module. The
> core retrieves struct nct6694 from the driver data of the transport
> device, and the transport keeps registering its own MFD cells.
>=20
> The USB driver now creates the IRQ domain before submitting the
> interrupt URB, and kills the URB before the domain is removed.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D10

