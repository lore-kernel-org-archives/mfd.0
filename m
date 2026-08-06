Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C62EEE85;
	Thu,  6 Aug 2026 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022177; cv=none; b=Td9uo/L/1rEoTXZ9Z0w8Ao2sRhKgtun6rOYIYQP4SeViv45TAjrkKXLqitfnucQ2dY+eLpJOuzvNbMm6/jEmfI0LQEifymTl/C24u+X9uGfOAO4Qyasn/Mqrbtjgc5IYi7cAuvDtPx+QMlbNKk2vnIeYT6H90M5zzledQqQJvYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022177; c=relaxed/simple;
	bh=0SYx3cMTHZwoACvsJE2GI92ixgU2d4VrH/fJ8U9gidE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uhEL59P04UA9M+sJnX2OLhsHxegPnunnOFWIIuqX+1KACJ1h7E6EeB59J+Jb2Z00uJorL96RLk6Z5PGUnBKMNAsgDj4rBuejIUlZzut0TxPw3Otr+/6yR5stQihA6zYWO3nbK0u/4USoH14lzeLtgHoLCCZHIPxudAQpgcmqDlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oskrqOSb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oskrqOSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0538E1F000E9;
	Thu,  6 Aug 2026 13:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786022173;
	bh=z5w1Q1IkG9sX+hZCFavA/7VjO6VYl+gDFesJscCb7qs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oskrqOSbypOBb3ZziiulKYAAZOt15djUTnihNCy0alaS4vfmuZwTyA6Gj2/x53xA/
	 syf2p8Bqy+UgsOu/g2o5lENsZIePheNVMhVjUGCiZ1xu6Qwbq8BlKlv0KvKvnrk+8i
	 Hk5FUGmI2UEmxKvmJxJSKgNtQCaAwPZaEvhBeV1Z8VgRX/sepXoEQsQDkmUwoRXWmY
	 4ze3m31+YX0Qp2pxyMP2QYxwNg+9ITZzlUc9umXs1p3zQMI3Q8r7V4yUrACLz6AU+v
	 25pnLn6Z6Um27tciBna0KWaJBmCm+vJmSFSeTrjRhNR4i5yd0JNMN+2uXecU+bk6UL
	 ZO6AyHx+HFrig==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260720115423.94994-1-pengpeng@iscas.ac.cn>
References: <20260720115423.94994-1-pengpeng@iscas.ac.cn>
Subject: Re: (subset) [PATCH v2] mfd: iqs62x: reject zero-length firmware
 records
Message-Id: <178602217277.2914276.15646333234311178313.b4-ty@b4>
Date: Thu, 06 Aug 2026 14:16:12 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 20 Jul 2026 19:54:23 +0800, Pengpeng Hou wrote:
> struct iqs62x_fw_rec includes the first data byte in its fixed-size header,
> so the parser advances by len - 1 bytes after that header. A zero len makes
> the size_t cursor update move back by one byte, so the next record overlaps
> the current record instead of following a valid declared extent.
> 
> Reject zero-length records and express the remaining-size check without an
> offset addition.
> 
> [...]

Applied, thanks!

[1/1] mfd: iqs62x: reject zero-length firmware records
      commit: 08ea045e0b82cbcadb7a2efc43a23561489a00f2

--
Lee Jones [李琼斯]

