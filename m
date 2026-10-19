Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E84E46AA7C
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 05:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386309; cv=none; b=jSggUOVh3P7HIn9zOdV0sHBf7AKWWyCMhp4Yv14awPOniVl3vG35ziM0hkkkamanf1xxIVaszyzwe9aTmzz2mL5aP1J2dBO/5Jxwq9gnTF+xeDq+JfIg0WGGvu9SQhPowC9xfjQ+PVKkS+pGuYQtdDDtvm+/Eh6c+h0/Fy78ae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386309; c=relaxed/simple;
	bh=Q3kAfWdpDQ/pdzqrN2UsYKkYrM/I8b+/JjYuruLvlxw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=BTeArn80/3p9zPXHiCUvE6G2t5zYGzvroFXwrsNVgfUnkSogAVuftP1F4IIKI1Qy0b1e9aNbWpvefNdfgOfpgaxF3Fks7/5kBv8k/udLTv1f0dD+BH0LTMQC2MxKu4f8PitxWSyIh+NOoQOx3KgE1lXiQ5dLYX7tSV6hvo4UBWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g097/EwK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g097/EwK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3291F000C4;
	Mon, 19 Oct 2026 05:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792386297;
	bh=Q3kAfWdpDQ/pdzqrN2UsYKkYrM/I8b+/JjYuruLvlxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g097/EwKU5A9z9itQDK37tzSTY5kYKk9wqNyJBs3D0E9rBmCM9EsLhT0kJ3kzoEEH
	 Ebsaw0jgGQZezMsx2FNBW5SwwFzZyEIPeu1vdWgYGr5T1MGCtbNMrHFF103mGPZdO1
	 RBFxbdgOu98i3Om8lThpsGwY9+okRxY66tu1nIw7u8mq8S+NjKfV5t/AhhTAaMTtNX
	 VAVdH8Hy67t4XM/sna0c+LWNTCLItTE89RCLuOwprT1jn0B+Etwj1TuoYBOPFZiJHI
	 affuq1Gnje2zzy1NYJYuBzsL5B8PbEZr3AFX52XYPXtwBBi8v9U738uKO6TINjF+wT
	 s0iLA/NOqdY6A==
Message-ID: <sashiko-outbox-176657@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 3/5] clk: ambarella: add CV75 RCT clock controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019-cv75-soc-v10-3-d386065e2dd5@ambarella.com>
References: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
 <20261019-cv75-soc-v10-3-d386065e2dd5@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 05:04:56 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Long Zhao <longzhao@ambarella.com>
>=20
> Add a table-driven CCF driver for the CV75 root clock tree. Register
> the core PLL, AHB/APB fixed factors and UART0 composite clock, with
> osc supplied via clk_parent_data.
>=20
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-cv75-soc-v=
10-0-d386065e2dd5@ambarella.com?part=3D3

