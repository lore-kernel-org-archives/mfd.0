Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE6C3B893B;
	Thu,  9 Jul 2026 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590375; cv=none; b=s+i1XdKT8uGJNggJNawGHtz4SfbCvHAIlKpSgW7MlG1N774HTjawck6skK3098f3yqP3TS0LxftVO6MB6Qb8tLz7zcuAo8mZpj6EA0gX55zHBPL0ezAs7d5XrkdgtX3zidj3RGPVag5xMsrfRqI9UMNRYaskmya5ivscpXUehNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590375; c=relaxed/simple;
	bh=EQoPWAa+mSBuqCYVzW5HxyAy6H33Gx+ecnlEUF/SeSQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DmjShgzRuJUi1g96eprjRaWD30yug5K8m67LfKqqFwGZ5KI/6oFUSmTESU2rZJp/h1OAGwtlOBN8Pae4sNDPk30tuLJ2d0F8BiCfUalkHP4yP0EJjEQYnx2ffEgzk4jvnV/DEDPpDPTQyjeXb+UKTrMlkaxbna3Rfx44lua0hjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h08mm/lu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h08mm/lu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E751F000E9;
	Thu,  9 Jul 2026 09:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783590370;
	bh=5AkcMFJyWONxEvezaKfUD22zg5BeZdEfH0NyEf0smRY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h08mm/luu8RASqEkWFdjrAvk/jyI/ARUJSNffZ8yzsgaetcl0JpF0qzDlE5knMTSr
	 T1wn+t/EZBJpxd7EVloz1TxuZ9qBjBl7hvDv3I6EzAKqRjBF5HOat8AxmHXZ9wL/Hc
	 Nv/6XpkpcRT4s1LQMs1GoupUasQo3UCBJdALQrdOhWz07jLT9Q/7efhj5TtRc6AFFl
	 E1utBWZhYL4aRTI+gGzznznRcb1veMeealrxHhN1eQPNHEinR/l8+M7jBqMKR2fQr5
	 OKD6/AbnSYLjUNJXSbEiyA0j4cyjcwzNI5raDXKDHkoG2fcIJMM6yx1A2+x3jY451v
	 j5nhWQW4I5lgw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, mdshahid03@gmail.com
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
In-Reply-To: <20260703105937.62541-1-mdshahid03@gmail.com>
References: <20260703105937.62541-1-mdshahid03@gmail.com>
Subject: Re: (subset) [PATCH] mfd: viperboard: remove redundant NULL check
 before kfree()
Message-Id: <178359036929.2068439.9015164956394780364.b4-ty@b4>
Date: Thu, 09 Jul 2026 10:46:09 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 03 Jul 2026 16:29:37 +0530, mdshahid03@gmail.com wrote:
> kfree() safely handles NULL pointers, so the explicit NULL check
> before calling kfree() is unnecessary.
> 
> This issue was reported by ifnullfree.cocci.

Applied, thanks!

[1/1] mfd: viperboard: remove redundant NULL check before kfree()
      commit: cf9775233b4d1618dfac5e84009f36eba1e7fddc

--
Lee Jones [李琼斯]

