Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954FB36F90C
	for <mfd@lists.linux.dev>; Fri,  7 Aug 2026 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091843; cv=none; b=FwqXC8RYMEQV4/toc3IXfLQYnqaZZIV1FTd7SLQ65G3CwUOJnllVFZRKLl2TPvL/OPbj9pI6FgfjNMjh12Q3Rba56k/QsmfjuQxt0EfUP1+eHA6n+m35pUR51f5AYX516zDOakDunhaYp5RSWk8M0bxehnujKbVLyh3x21u1NPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091843; c=relaxed/simple;
	bh=fuFEj1OU+QhcCZyLvfuNnHiX6rf0ZBxSPqBHjTqQNjI=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PW0V01PQ9VDZ1g1Xx3GcQzzlk1SB6aDbDbc3K4234CYVyrOLVaYZIRpMuNpVaDCCb4cYP7Q2A3YnYmfX7HDURszTA0RUNlg1ctGHZCJQ1W5PdJEtIRTy2AVtxuZ1dTkr0TPgTYTiBB9eJstrxSGunfdRKEd8Cf0ycrNqIf7GrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=EE1LiQXR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="EE1LiQXR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b966dd74so18843925e9.3
        for <mfd@lists.linux.dev>; Fri, 07 Aug 2026 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091839; x=1786696639; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eGMUF25P693ePk/L/oUapnM3i3tck6ovRZHhcpx3Kbw=;
        b=EE1LiQXRR104mIcrrL/Fo+8PfDj3Lw1TwhvwNvQCL3DNy7foQrILQHAiWovDfUR/vM
         NoObS+Tox4q4GxuRu6zARvKtncRR2Y38ZfZpCfA2b99RE4fjEbVpnK2V7uAKgvdio95W
         DMYt/puRHk80hByyQ+hmXxgvcyN8xvT46hGsePsIzy8Rc0NN4hb1QQZqx4ruzKVY6Cto
         qP1uYP26U87V6MEqGIcA+1EDZ1f/lkCpnHHtnJ5sX+jjdXR6KYsETGHWNX6+qsBIfaMN
         939yYUkCFL9pdhD9qI7/dQ0LfbxpHoDQymhq+PfR/8zyfbnzf0GoTFqC3QOa/8CVR3d2
         KStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091839; x=1786696639;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGMUF25P693ePk/L/oUapnM3i3tck6ovRZHhcpx3Kbw=;
        b=Zz8ypfS2f1mU0tC+qEVcbi+4F/DFCDy9ZMxmpEI18i1ixMwagvK5jVFAQrd9vVcBNJ
         Eroc8RHcKKZZQ7Vr6wWF8RMQN+w0bsjGC31bU4iwVkRy9TxI/y1CDDsY0VN1aZG+UMD7
         TYVe0/+bUngM7LwySsDVshYJo8b6xfvRDr5QvDDcV6CQ+9oN+Q4ZHFDo9CtLB9i+OEoX
         g3ZkSG/YvTgq0+jOUXPovPgJXwcdNurZpJ2jMlsAl3v1bu724NujZIyDqDa/Xjpf1Kvt
         knmXfeBuzrvnqbPQVnv3u8Vst9IwIQDMrSYvGl4nLbqpYEYHQeCkun5ApHpCi41B+P4l
         ixxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAXZGsn7Qnw31CW7s3/Bm+bySBrKKYo3gJHJ5tJzBF2QKdFoRJx5RV4NvrJgS6+oLSeFc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxroe8eoCDCQ9DLuxhX89KbIJBtn/dJgY0Ri534bs3s8iW2x7B5
	5649ZQErSO5thiNg2pihN+EWFr4ZvDfoLMic18XlgmhCynh9b8p6cGpdjMuaBB7PCTU=
X-Gm-Gg: AR+sD10ZkCEnGFO5xoE0o9SAKflCJzIPGH4CDzfwSHAxERDVDBGbB9I3y/16Rvg+euI
	sr/OvAThA5YAX9pWxGtbtE5CqRQP03t07r1RwGAelLseP2O60v3kM7fs+L+iqJuszNl0gHOTVcc
	z3/fQ6xZy/ohELKCJlPqsqxNE5Qleb5098R+dY3xstnXbl9Zy2FMaKxLRkGMtaaSfTKvPEjJ/9l
	2BZ42SJo37eatEQYZB9TtLonoTa/neghEmA9SPtnkGJbEjxItW1Ii3v9P5CpHfBCIY8f3eutPOQ
	J7TmlgL7ac+WjSHIoBy+m+SUvm80zlCaM8dqQ+S0qhRSRTtxSPFj9c1/zZsQ5kpKzclker0eJ8F
	eonv9wfAWD2dznBOgWYZqJB2qtxFWE2bSD2JPomcBSrIEWGtcrY6+FFRK5xoP79qPd/yfvFgSMe
	hmfoqqh7jFfZ8ix+9QLaZ5PUyyyKxeUePr5iffYdZ+cyBvDRPir+otV2ZtY7n7fQdVsv4CsNU=
X-Received: by 2002:a05:600c:3226:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-4994e7ce0dcmr191510415e9.13.1786091838712;
        Fri, 07 Aug 2026 01:37:18 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 5/6] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
From: Tan Siewert <tan.siewert@9elements.com>
To: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org, 
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, lee@kernel.org, andrew@lunn.ch, 
 jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
 anirudhsriniv@gmail.com, tan.siewert@9elements.com, 
 linux-serial@vger.kernel.org, mfd@lists.linux.dev, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <d54bfe689e6a0f318961588ab6b72fc2b09ebb47.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182923.193353.5571242599516025969.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=355;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=fuFEj1OU+QhcCZyLvfuNnHiX6rf0ZBxSPqBHjTqQNjI=;
 b=l/snFEuA6s9C2vYf6o5nTOQ8zlqd9Il9CufwGf1MkTpOA+4+PTdQ2n5jUh9glDVuzfjCNBQVJ
 WDZc+yLTygNBpO/pif+3n/9h9ZDIVzxwiVZwcXHim3sLopjfT4uTkcv
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

On Wed, 05 Aug 2026 14:19:52 +0200, Grégoire Layet <gregoire.layet@9elements.com> wrote:
> Use the ast2600 compatible string.
> Make it more precise and enable specific ast2600 properties.
> Still use the ast2500 compatible string as a fallback.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>
