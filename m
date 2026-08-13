Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5B647988A
	for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 14:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786631030; cv=none; b=h8zi8ZzncCLg/VUiVO4HVpu6oPUHKj34bEzDdjjIXl+LcFtbqbCuyq/4pMwDCW1rI8AquE3q6JCf0ZeX1qKl3a6qG+IJDbqHXAYpEdJiybtBPwbTEh4bdbaMxMICJRTccgyVzkpRRx1angLlYdFyaz1t7sxosqGSMBZ7no1UOsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786631030; c=relaxed/simple;
	bh=xzA6z/ScLQYJHgyemPeQLuBov2qwLz98o4xTEP7Bomw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LKvu7B4BaHT/FBQzxcQnzP2XePCxislJlZYNYrhVTsgM44wTGvR5AIAQoYx5zDlSymaaVLb64jWTWb01ZjYRMoxfrYabEDaQGKemwgAGRtl2sKf8PySILgOxM0QLQjL4CeOzplRRhb9s1qzNB5bggg+OdvmGaFv+zN6TOhC3f20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=BMO9iq9v; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="BMO9iq9v"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954a9e8490so6225645e9.1
        for <mfd@lists.linux.dev>; Thu, 13 Aug 2026 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786631026; x=1787235826; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zAK75b8ZUtjKJXv+z/knfiDKVadFa2L6rKVWPT2qQc=;
        b=BMO9iq9v4+39Ytnk3zg51BXbTSpE1p9BjBOHJGXDhHFnQtqSaCmxE8fclDZm3DMSVP
         4PfUZXu3WyADI/B5Z0BtumnVQCGAn8/OApQC0h1QAa3ClCVnh5JKPZTwEpHfC1O/YDWQ
         TrYuV65rF8pWTgTIYSN4STRRNqyIYAtH1TLhT4ete89Xou5V5yOxyMR1Kj1BiCfUjtAV
         d9amB36Unti/EFrii+7brVMFzROkn5rnlIcDbo8oNoIy4ALMtsO6V1viONYW00HbDQV1
         DiBdN8ahtXx7NgjyqvbJ3DlbZYrYhhmAJgbSYFKdLkoBG7d+Ka3aBSEspMcAUJekB59f
         Mknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786631026; x=1787235826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3zAK75b8ZUtjKJXv+z/knfiDKVadFa2L6rKVWPT2qQc=;
        b=oPasojLSidRPvDgGKUZySsKWHBjuzEUz+NZJvzMJHGxZDvpyz8RRWUQ+DPX2kz6ODZ
         MIhNs6eJkZgJSEseqSZQYXVvApuqU6zitgEj1A+uQCZO5DqE1+eHKVux9ZJt7reuigDw
         UuqvSukB+BN3NdcQ6xAu76BklvINl/wHWfgu1BMNKHxtvqxjH4FdRH/3vAZxdCapMGEB
         RPkGoAmz/TENESeldlN32jJabmOgOhOiGvgZgZW7IYXsHr+CfmTxdq0+g6OTnh9Il6FY
         Oy/WeuxgeIX/Su4YirYcY9DMqJkfF+eLWBX/akZKZvBh87ZP8i0PRejv3EGLaKyxThSI
         blMQ==
X-Forwarded-Encrypted: i=1; AHgh+RoYJ0mbIpFU7lIvDP3xTP+qNd1/sWBGMCv+7R6mLViO1apxz26I0aDT4K1kazta6DWI4so=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGaGJ7czGCsY5Mhw7wDexFOGU/jObezC5GI7LuVXmlzmUKtZyg
	NIucylSk9tknkeL4Q8LCDllJn5X1Dei4+95Wsz+ZS01fIE/BsxUa3s4FMIp/E4Td8RA=
X-Gm-Gg: AR+sD12h+D2ljffn2UTGwZOuWKMp3IqzgvKi8ZL1KN0ZCFr5nNIGdVfmvb/xW5xnGJL
	a0zo3vp5JGr1nn7M+krP4R9stIO8X9IMMclyo/up0BCdonDaNKmw0D0OOJRBFnOcbIYYCmgwrnh
	6bRR9OyS0okfl3zStrwAne2urUTVMmF8xwZmG4ChJYdqUaRZLAhapdo1EtRQ3U8ashyAlyfYiIn
	CwVhj3D3Rn66lCph+MfFQQJNr2funHM3WR9WkPlug1ICHFR61FFOpzTxCprVBpl9W8L+2Clogdy
	rhrBTuazX8ZQE+FzXBZMzWUwvtMGVvHUX+ltiQyctKxYuZvHh55eMNB0+v2KpHBZz6Tnae7e9nP
	BLamiRDieIno5X89vt1r1Le0xQIh9jNlmtjHI/Y8JA2qj10DXt4Jt1M6MUcBNEATqxyvYzfAvA1
	9wqAfALbvb2J5I4958Wpp8nzGLr/ifZmzW2W8Q1/cf3VajVNhdiUioBCB+YYi+6ki0g+w+HlhRJ
	FkrKXiH8pWp0ojjgARoihmZ/pYWZAsVmfjFu67pl6xCS4yBsqP8
X-Received: by 2002:a05:600d:6409:10b0:499:84fc:4548 with SMTP id 5b1f17b1804b1-49984fc45c0mr29737445e9.5.1786631026583;
        Thu, 13 Aug 2026 07:23:46 -0700 (PDT)
Received: from ?IPV6:2a01:599:447:e518:cc7c:e59e:1489:db94? ([2a01:599:447:e518:cc7c:e59e:1489:db94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981e2e266sm51262395e9.2.2026.08.13.07.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 07:23:46 -0700 (PDT)
Message-ID: <15d1ced4-2400-477b-800d-fdcca80559bc@9elements.com>
Date: Thu, 13 Aug 2026 16:23:44 +0200
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device
 driver
To: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lee@kernel.org, =?UTF-8?Q?Gr=C3=A9goire_Layet?=
 <git@gregoirelayet.com>, andrew@lunn.ch, jacky_chou@aspeedtech.com,
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com,
 linux-serial@vger.kernel.org, mfd@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
 <178609182923.193353.7287772568467157519.b4-review@b4>
 <CAFi2wKZdJ3LxJVDqC2K79T0JhoOOWSj=ZmL9pB+Lka_aXDXatQ@mail.gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <CAFi2wKZdJ3LxJVDqC2K79T0JhoOOWSj=ZmL9pB+Lka_aXDXatQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/10/26 12:36 PM, Grégoire Layet wrote:
>> But you're adding the UART devices here which now means that the core driver is
>> doing more than MSI interrupt init.
> 
> I might have misunderstood but this is creating the UART device by
> using the 'serial8250' driver.

You're right :face_palm: I haven't had enough coffee when I reviewed it.

Sorry for the confusion!

Tan


