Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33C3A2E2B
	for <mfd@lists.linux.dev>; Fri,  7 Aug 2026 08:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091837; cv=none; b=E7KTtHoVSvMApWhAEgc/k3x4xKfBBrdirt12Rxt9FgB+Oz0VHeMCUZW8Ml2pLkWeukU897h6P8yUMxgF+wpijlP8SjKrciZgEONMdy2ER4fvD2PYmROt8YCWCJTTLF4sUAi8rOx5akbS+wXKj5XH57xZ0x/cW044cD+zb+6C7DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091837; c=relaxed/simple;
	bh=GGZJlZzLfev4HdzTInv04JY3/Vaa6A3FvI60xmArBaQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=R+8Hjn3TC9s+yeZkER1vWyiKeGG/92dcLGj1QAVjWFTmQkPxk73i37q4GLSnijqzDTTLNnXdHR7fjdnLWm9urY9oZOKWr19WAtOWEqoJAQyrjmqpGYoUPPbLX0CJ6U1/n9GcRefMyuuuywilFA0361BuiCfoH9OnxCtII14h5oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=VLWnkYkv; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="VLWnkYkv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4956869750eso22623655e9.2
        for <mfd@lists.linux.dev>; Fri, 07 Aug 2026 01:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786091833; x=1786696633; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Aa0XOZmSfIfd7MTfSKuapoTZ1eZa+JY5dctKtdAPzg=;
        b=VLWnkYkvYgyBt7kJWVGj3ApAtiK5CUL9cHan1/Sw72JolZT8oGPPelUcKZvGz/p+G+
         CfdYeWpX0MTMTak+FNgAWA6WffaVQ9e3f8R3oHsFNIYKbYSGzICcDmRdvn7N92TQ+axn
         7E6Q9tOb36xL1cgLESIO4mbJ5S9BNSGzUTvvc1LwoO+E76ISjaGZOEJEeIGtDvIzO5oC
         Q/iyMSNG3bD0uJHmcXVeqv4/PJirBohZEGuwOayhx+tgrX7PUfkLYqIieQrRE+WRHyYe
         Z4ryV5Ju/pQu8A8sZe2FN59Rpv711ySUvMpigAWrAnrzW9htQ+KOXrSJMMNEKovLx+1A
         GOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091833; x=1786696633;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Aa0XOZmSfIfd7MTfSKuapoTZ1eZa+JY5dctKtdAPzg=;
        b=XemJn7nSXLvjXdrhMDe/6QMdnzfiZuUwh2igX7LSIPm1XN8nqOocTnBDcj3idd0HpT
         /3Ow/3G4YwGMNuwJ1F8CIZ8rGChK+pGd/kXHHuWUVJZX8MFZIT5bQDZrm3J7TOaBq4fh
         yVRYqBnpSAKcHOa+bd9coOfd4fEjAROO4cOj9k/ORKsWzrxHj8VvteEr5N9w4V0XJCWJ
         hDcCUAqWFykZuTxluXbL0SBGLlECdgtvpVBzNYsVfj5rNYV5o2GufLnwt17Rigv0XM2t
         1CwmXjCNJcQVXiujrvAtyXH7PJnBztK/bKcFRt/g0EfNNXHrtYHOIRxM16obCaossIZa
         oorw==
X-Forwarded-Encrypted: i=1; AHgh+Rrph3WSR59+knsrSb9aDG/XlclYQWUYByt52QrOiObNhN+Kpp51LmlKW+dHfNX8Vp/0hfo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSdBvvzFNX3tJEV1HVmcAYhc5ckQkmhCbMQlU7ij1Oi4gckLcu
	JH0f+r6wjKQqir3GRrEJuZlskAh3C9ObR9k/f8C3R2rSwi+f2I3Jd2iYjT/5ZGI+z2Y=
X-Gm-Gg: AR+sD101GTtHUmWatu3rrNLtHgTTDQmdlqokPQICzeQofVSGfsyZ9AqOgAwvsZB++O0
	kB5fviOWgzVqXlgeqmSQTW4YPJasUkBrmGVm4o6D6OpcWl5wDzE7Xrfe6GUeg3h86IrAoDeXe55
	V/FdC/3xz3qXqMDHQJoHdqGmbMn31HW2b8UvbcYiyv1XCGLQD4/0nVzngzxrLTmVlCxYLdoWog2
	Fw+6gj3iBgvQRcqYGdrrAbfgc2oDKORERBrlG4BS/3QZ0XLpq+YqsofD9KS12EthYFWKUwpSAFH
	yzaa2+42XWy+ffh/mIWViLCtNxpK0VvWRlxKXO5AGJutV1dfOXXVlBy9GbQOU/YDpsxYRmPSgpl
	qrrLRe+u717JKlsAJ+P+OG59fHeawWCdAhoVor760kv0XXDGAO2m+xK1O5dWthnrc1lJCO4jsvV
	28rpXwnF+8inB/fOYW54AFUfruMqJenUU79bvJSZmUR4KaiCvPVe9uVJsAMstsafNAEsy6Pi4=
X-Received: by 2002:a05:600c:19cd:b0:498:28b:1045 with SMTP id 5b1f17b1804b1-4994e793f63mr257933615e9.3.1786091833285;
        Fri, 07 Aug 2026 01:37:13 -0700 (PDT)
Received: from [172.20.10.3] ([2a01:599:843:2744:7f5d:3df0:76c1:3705])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995e9e7171sm17795195e9.1.2026.08.07.01.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 2/6] serial: 8250_aspeed_vuart: add
 aspeed,ast2600-vuart compatible string
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
In-Reply-To: <56aa0a5e26ea76e4f9a27ed059d2b05bec9cffa5.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <56aa0a5e26ea76e4f9a27ed059d2b05bec9cffa5.1785932211.git.gregoire.layet@9elements.com>
Date: Fri, 07 Aug 2026 10:37:09 +0200
Message-Id: <178609182922.193353.8621406142541186098.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091831; l=299;
 i=tan.siewert@9elements.com; s=20260527; h=from:subject:message-id;
 bh=GGZJlZzLfev4HdzTInv04JY3/Vaa6A3FvI60xmArBaQ=;
 b=HyICfGSOOmuh66kJTlxZqHYzoimh8x1WZTAAHnZ2sbtvqD6Bz0e7JwNlt5sEHOPp9XSolfUBZ
 4LtUL1zC+S6AO+F0anHYOAXIWc3YKWwmxlWPBV3bzebGcSeZmzvR0I6
X-Developer-Key: i=tan.siewert@9elements.com; a=ed25519;
 pk=ORQd/zQf+LsAvJGXP1CjQwVO6t6iEOGq/eGUsmRVTG4=

On Wed, 05 Aug 2026 14:19:49 +0200, Grégoire Layet <gregoire.layet@9elements.com> wrote:
> Make the driver compatible with the ast2600-vuart.
> Enable specific configuration for the AST2600.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>

-- 
Tan Siewert <tan.siewert@9elements.com>
