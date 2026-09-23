Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECA6414DF4
	for <mfd@lists.linux.dev>; Wed, 23 Sep 2026 08:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153934; cv=none; b=QyNnQqNBGwp3tFfcsHisSLVR6n1NN4fVbZhFI2HKWw8IORb+S7l5PLXlV22Eq/9d4BrMsmpTkseBLHkGeizDTQnCFBG03SMOSKcBGPo7yRrGPRB0gI43J+8BdA2GZyMB2Cu3vWOJUmezXEonE+yJJ7BC3qfX0jProtuqmlkRTas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153934; c=relaxed/simple;
	bh=wp9st1BvYKL3moTgKsOzAzl8h7KwfqiHE9qXmrW9PKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dJFpaUdjuJ6DL/eU9qiDa7wJNjIcZJQtplhqbo3QlLGw5oqzQAeSDVeBj+H9H7K46XPtZ8C8sm+fMftpNlWmDo9WHgzJex84qx94DPXgbYnCyK9uBnOG7AIVCSM0bBIKsXYo7V4tbXKSKSZl2i9wOL0XLLiPgVmTAcWP+s29Jbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guiPlzrF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guiPlzrF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0DC1F00899;
	Wed, 23 Sep 2026 08:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153932;
	bh=oItodQyDFohsMI4VZnQ53MiKvOWTs1y0xSdO0usUoyg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=guiPlzrF6m2ACwS9c/bEriZbZ9W5UiecMxuxYAdq3aZeMaFMSXDkRKiJyyqzw7wdZ
	 31w8ZRe3UqlExQaphbObKiqacZKnlGtYPWFy+eqDvv/P/sC9QgPWzt3XVXEWzmyak3
	 XMuoWFiLGWfTi9YZZR+CSnJ1Qha/InuXG7kxJQkysD0W6lzJM1Uhs4BlsVg6bf3tIo
	 rRT7vT98twbEcSZD7mv0T/X7EqAyE2WcilVzZ3ZQZ9nidXjNE+biPRTCv7qkQzrYCl
	 urUOrRWJsyIgvd9ZjwDnJsFC0Iv1bouBTxnAy5Do8DcesaxHVGwGHUyzvXK8Z0ylZd
	 F3Lr/SZzro4Lw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] mfd: loongson-se: Fix miscellaneous issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qunqin Zhao" <zhaoqunqin@163.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260923084802.29508-3-zhaoqunqin@163.com>
References: <20260923084802.29508-1-zhaoqunqin@163.com>
 <20260923084802.29508-3-zhaoqunqin@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 08:58:51 +0000
Message-Id: <20260923085851.DF0DC1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>=20
> Address multiple historical driver issues discovered by the Sashiko
> Automation system within the loongson_se_probe() initialization flow
> and the driver's interrupt service routines [1].
>=20
> - Add an explicit bounds check in se_irq_handler() before accessing
>   the engines array to prevent an out-of-bounds memory access.
>=20
> - Validate the id argument in loongson_se_init_engine() and reject
>   engine 0, whose data buffer is reused for the command buffers of all
>   other engines, to prevent out-of-bounds accesses and overlapping DMA
>   buffers.
>=20
> - Switch from devm_kmalloc() to devm_kzalloc() and initialize all
> [ ... ]
> - Add the SE_CMD_STOP command definition.
>=20
> Link: https://lore.kernel.org/all/20260618095949.GB1672911@google.com/ [1]
> Fixes: e551fa3159e3 ("mfd: Add support for Loongson Security Engine chip =
controller")
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923084802.2950=
8-1-zhaoqunqin@163.com?part=3D2

